express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'
Year = mongoose.model 'Year'
Song = mongoose.model 'Song'
Show = mongoose.model 'Show'

async = require 'async'

router.get '/', (req, res, next) ->
  bootstrapData (err, folders) ->
    # If user isn't logged in then next() so public/index.html is served
    unless req.session && req.session.userId
      # If we're in development, then render via jade so we can set loggedIn
      # TODO: Find a more robust solution, this is slightly messy
      return next() unless process.env.NODE_ENV is "development"
      return res.render 'loggedIn',
        user: {}
        csrf: ''
        isProduction: false
        years: folders[0]
        shows: folders[1]
        songs: folders[2]
    # If the user is logged in, then render the views/loggedIn.jade
    # This way, we can bootstrap the user and csrf objects on page load
    User
      .findById(req.session.userId, 'email')
      .exec (err, user) ->
        return next() if err || !user
        res.render 'loggedIn',
          user: user
          csrf: req.session._csrf
          isProduction: process.env.NODE_ENV is "production"
          years: folders[0]
          shows: folders[1]
          songs: folders[2]

router.get '/rest/*', (req, res) ->
  res.redirect 'http://74.104.117.66:8044' + req._parsedUrl.path

router.post '/login', (req, res) ->
  unmentionables = { email, password } = req.body
  login req, res, unmentionables

router.post '/register', (req, res) ->
  # email and password
  unmentionables = { email, password } = req.body

  # Check if the user exists
  User.findOne
    email: email
  , (err, existingUser) ->
    if existingUser?.email is email
      return res.redirect '/register?err=emailexists'

    # Create a new user
    user = new User unmentionables

    user.save (err) ->
      return res.redirect '/register?err=email' if err
      login req, res, unmentionables

router.get '/logout', (req, res) ->
  req.session.destroy()
  res.redirect '/'

login = (req, res, {email, password}) ->
  User.authenticate email, password, (err, user, reason) ->
    return res.redirect '/?err=login' if err

    # User logged in
    if user
      req.session.userId = user._id
      return res.redirect '/'

    reasons = User.failedLogin

    switch reason
      when reasons.NOT_FOUND, reasons.PASSWORD_INCORRECT, reasons.MAX_ATTEMPTS
        res.redirect "login?err=#{reason}"

bootstrapData = (cb) ->
  async.parallel [
    (callback) ->
      Year.find {}, 'year', callback
    , (callback) ->
      Year.findOne(year: 1977)
        .populate('_shows', 'album year month day version longDay')
        .exec callback
    , (callback) ->
      Show.findOne({ year: 1977, month: 5, day: 8 }, '_songs title')
        .populate('_songs')
        .exec callback
    ], cb

module.exports = router
