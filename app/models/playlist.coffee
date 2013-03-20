class App.Models.Playlist extends App.Models.Model
  idAttribute: '_id'
  url: ->
    id = @get '_id'
    '/api/v1/playlist' + if id then "/#{id}" else ''
  defaults:
    _songs: []
