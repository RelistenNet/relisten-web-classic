express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'
Year = mongoose.model 'Year'
Song = mongoose.model 'Song'
Show = mongoose.model 'Show'
Playlist = mongoose.model 'Playlist'

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
  Year.findOne(
    year: +req.params[0]
  )
  .populate('_shows', 'album artist coverArt day id month parent title year version')
  .exec (err, year) ->
    res.json year || {}

router.get /^\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/?$/, (req, res) ->
  Show.findOne(
    year: +req.params[0]
    month: +req.params[1]
    day: +req.params[2]
    version: +req.params[3] || 0
  )
  .populate('_songs')
  .exec (err, show) ->
    res.json show || {}

router.get /^\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9])?\/?$/, (req, res) ->
  Song.findOne
    year: +req.params[0]
    month: +req.params[1]
    day: +req.params[2]
    showVersion: +req.params[3] || 0
    slug: req.params[4]
    version: +req.params[5] || 0
  , (err, song) ->
    res.json song || {}

router.get '/playlists', (req, res) ->
  Playlist.find (err, playlists) ->
    res.json playlists

router.get '/playlist/:id', (req, res) ->
  Playlist.findById(req.params.id)
    .populate('_songs')
    .exec (err, playlist) ->
      res.json playlist

router.post '/playlist', (req, res) ->
  playlist = new Playlist req.body
  playlist.save()
  res.json playlist

router.put '/playlist', (req, res) ->
  Playlist.findById req.body._id, (err, playlist) ->
    playlist._songs = req.body._songs
    playlist.save()
    res.json playlist

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
