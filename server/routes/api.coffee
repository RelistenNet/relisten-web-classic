express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'
Year = mongoose.model 'Year'
Song = mongoose.model 'Song'
Show = mongoose.model 'Show'

{ _ } = require 'underscore'

nconf = require 'nconf'
Subsonic = require 'subsonic'

subsonic = new Subsonic
  username: nconf.get('USERNAME')
  password: nconf.get('PASSWORD')
  application: 'spreadsheet'
  server: nconf.get('SERVER')

# Everything added under this router will be prefaced by /api/v1
# You can change this path in your index.coffee middleware

router.get /^\/([0-9]{4})\/?$/, (req, res) ->
  Show.find year: +req.params[0], (err, shows) ->
    res.json shows

router.get /^\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, (req, res) ->
  Song.find
    year: +req.params[0]
    month: +req.params[1]
    day: +req.params[2]
  , (err, songs) ->
    res.json songs

router.get /^\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, (req, res) ->
  Song.findOne
    year: +req.params[0]
    month: +req.params[1]
    day: +req.params[2]
    number: +req.params[3]
  , (err, song) ->
    res.json song

router.get '/me', (req, res) ->
  User
    .findById(req.session.userId, 'email')
    .exec (err, user) ->
      return res.json err if err
      return res.json {} unless user

      res.json user

router.get '/me/csrf', (req, res) ->
  res.json
    csrf: req.session._csrf

router.get '/folder/:id', (req, res) ->
  subsonic.folder req.params.id, (err, folder) ->
    res.json folder

router.get '/song/:id', (req, res) ->
  subsonic.song req.params.id, (err, song) ->
    res.json song

module.exports = router
