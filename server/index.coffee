express = require 'express'
http = require 'http'
path = require 'path'
fs = require 'fs'
nconf = require 'nconf'
PORT = process.env.PORT || 3000
TODAY = new Date()
ONE_YEAR = TODAY.setFullYear(TODAY.getFullYear()+1)

nconf.argv()
  .env()
  .file(__dirname + '/../config.json')
  .defaults()

app = express()

app.use express.favicon()
app.use app.router
app.use express.static(path.join(__dirname, '..', "public"))
app.use (req, res) ->
  # catch all to redirect to backbone app
  res.redirect 301, "/##{req.url}"

# Infinite stack trace
Error.stackTraceLimit = Infinity

http.createServer(app).listen(PORT)
