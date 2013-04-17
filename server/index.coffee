express = require 'express'
http = require 'http'
path = require 'path'
fs = require 'fs'
mongoose = require 'mongoose'
nconf = require 'nconf'
Mongo_Store = require('connect-mongo')(express)
csrf = express.csrf()
PORT = process.env.PORT || 3000

nconf.argv()
  .env()
  .file(__dirname + '/../config.json')
  .defaults
    GD_URI: 'mongodb://localhost/gdspreadsheet'

mongoose.connect nconf.get('GD_URI'), (err) ->
  throw err if err

# Bootstrap models
modelsPath = __dirname + '/models'
fs.readdirSync(modelsPath).forEach (file) ->
  require "#{modelsPath}/#{file}"

# Remove this and app.use forceSSL below if you do not want SSL enabled
forceSSL = (req, res, next) ->
  return next() if process.env.NODE_ENV is "development" or req.headers["x-forwarded-proto"] is "https"
  # Redirect to https
  res.redirect 301, "https://" + req.headers.host + req.path

app = express()

app.configure ->
  app.set "port", PORT
  app.set "views", "#{__dirname}/views"
  app.set "view engine", "jade"
  app.use forceSSL
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session
    secret: 'this is your call, buddy'
    store: new Mongo_Store
      url: nconf.get('GD_URI')
  app.use (req, res, next) ->
    # Only use CSRF if user is logged in
    if req.session.userId
      csrf req, res, next
    else
      next()
  app.use app.router
  app.use require('./routes/user').middleware
  app.use '/api/v1', require('./routes/api').middleware
  app.use express.static(path.join(__dirname, '..', "public"))
  app.use (req, res) ->
    # catch all to redirect to backbone app
    res.redirect 301, "/##{req.url}"

# Infinite stack trace
Error.stackTraceLimit = Infinity

app.configure "development", ->
  app.use express.errorHandler()

http.createServer(app).listen(app.get('port'))
