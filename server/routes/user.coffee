express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'
Year = mongoose.model 'Year'
Song = mongoose.model 'Song'
Show = mongoose.model 'Show'
Day = mongoose.model 'Day'

async = require 'async'
_ = require 'underscore'

YEARS = [1965..1995]

years = []

Array::getRandomElement = -> this[Math.floor(Math.random() * this.length)]

# Initialize years
Year.find {}, 'year', sort: { year: 1 }, (err, y) -> years = y

router.get '/', (req, res, next) ->
  bootstrapData (err, shows, songs) ->

    unless years && shows && songs
      return res.send 500, 'Sorry something broke, please try refreshing.'

    # If user isn't logged in then next() so public/index.html is served
    unless req.session && req.session.userId
      # If we're in development, then render via jade so we can set loggedIn
      # TODO: Find a more robust solution, this is slightly messy
      return next() unless process.env.NODE_ENV is "development"
      return res.render 'loggedIn',
        user: {}
        csrf: ''
        isProduction: false
        years: years
        shows: shows
        songs: songs
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
          years: years
          shows: shows
          songs: songs

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

OMIT_FROM_SHOW = '-reviews.reviews -md5s -updatedate -updater -addeddate -description -col -mediatype -creator'

bootstrapData = (cb) ->
  async.waterfall [
    (callback) ->
      Year.findOne(year: YEARS.getRandomElement(), '_days year !_shows')
        .populate('_days', '', null, sort: { date: 1 })
        .exec callback
    , (year, callback) ->
      Day.findRandom year: year.year, (err, day) ->
        return callback err if err

        Day.findById(day._id)
          .populate('_shows', OMIT_FROM_SHOW + ' -_songs', null, sort: avg: -1)
          .exec (err, day) ->
            return callback err, {} if err || !day || !day._shows.length

            show = day._shows[0]._id unless show
            Show.findById(show, OMIT_FROM_SHOW)
              .populate('_songs')
              .exec (err, show) ->
                day.show = show
                callback null, year, day
    ], cb

module.exports = router
