express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'
Year = mongoose.model 'Year'
Song = mongoose.model 'Song'
Show = mongoose.model 'Show'
Playlist = mongoose.model 'Playlist'
Blurb = mongoose.model 'Blurb'

{ _ } = require 'underscore'
async = require 'async'
nconf = require 'nconf'

# Everything added under this router will be prefaced by /api/v1
# You can change this path in your index.coffee middleware

router.get /^\/([0-9]{4})\/?$/, (req, res) ->
  Year.findOne(
    year: +req.params[0]
  )
  .populate('_shows', '', null, sort: 'date')
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
  Playlist.find()
    #.populate('_songs')
    .exec (err, playlists) ->
      res.json playlists

router.get '/playlist/:id', (req, res) ->
  Playlist.findById(req.params.id)
    .populate('_songs')
    .populate('_blurbs')
    .exec (err, playlist) ->
      res.json playlist

router.post '/playlist', (req, res) ->
  return res.json err: 'No user found' unless req.session.userId
  p = req.body
  p._user = req.session.userId
  playlist = new Playlist p
  playlist.save (err) ->
    res.json err: err if err
    Playlist.findById(playlist._id)
      .populate('_songs')
      .populate('_blurbs')
      .exec (err, playlist) ->
        res.json err: err if err
        res.json playlist

router.put '/playlist/:id', (req, res) ->
  User.findOne
    _id: req.session.userId
  , (err, user) ->
    return res.json err: 'No user found' if err || _.isEmpty user
    Playlist.findOne
      _id: req.params.id
      _user: user._id
    , (err, playlist) ->
      return res.json {} if err || _.isEmpty playlist
      songIds = _.filter req.body._songs, (str) -> typeof str is 'string'
      playlist._songs = playlist._songs.concat songIds
      playlist.name = req.body.name
      playlist.save()
      # Need to populate
      Playlist.findById(req.params.id)
        .populate('_songs')
        .populate('_blurbs')
        .exec (err, playlist) ->
          res.json playlist

router.get '/song/:id', (req, res) ->
  Song.findById(req.params.id)
    .exec (err, song) ->
      # virtual
      res.json song

router.put '/blurbs', (req, res) ->
  User.findById req.session.userId, (err, user) ->
    return res.json err: 'No user found' if err || _.isEmpty user
    { playlistId } = req.body
    Playlist.findOne
      _id: playlistId
      _user: user._id
    , (err, playlist) ->
      return res.json err: "You don't own this playlist" unless playlist
      output = []

      playlist.name = req.body.title
      playlist.save()

      async.map req.body.arr, (blurb, callback) ->
        { text, songId } = blurb

        Blurb.findOne { _song: songId, _playlist: playlistId }, (err, blurb) ->
          if blurb
            blurb.text = text
          else
            blurb = new Blurb { text: text, _song: songId, _playlist: playlistId, _user: req.session.userId }
            playlist._blurbs.push blurb._id
            playlist.save()

          blurb.save()
          callback null, blurb
      , (err, arr) ->
        return res.json err: err if err
        res.json arr



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

module.exports = router
