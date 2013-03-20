class App.Views.PlaylistPage extends App.Views.View
  className: 'playlist-page'
  template: JST['playlist']
  initialize: ->
    @playlist = new App.Models.Playlist _id: @options.playlistId
    @listenTo @playlist, 'change', @render
    @playlist.fetch()
  render: ->
    @$el.html @template
      playlist: @playlist.toJSON()

    @
