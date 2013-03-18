express = require 'express'
router = new express.Router()

mongoose = require 'mongoose'
User = mongoose.model 'User'

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

module.exports = router
