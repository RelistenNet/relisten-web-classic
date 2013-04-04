class App.Views.PlaylistPage extends App.Views.View
  className: 'playlist-page'
  template: JST['playlist']
  events:
    'click .song': 'play'
  initialize: ->
    App.playlist = new App.Models.Playlist _id: @options.playlistId
    @listenTo App.playlist, 'change', @render
    App.playlist.fetch()
  render: ->
    @$el.html @template
      playlist: App.playlist.toJSON()
      userId: App.user.get '_id'

    @
