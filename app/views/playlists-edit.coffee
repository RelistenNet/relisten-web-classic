class App.Views.PlaylistsEdit extends App.Views.View
  className: 'playlists-edit-page'
  template: JST['playlists-edit']
  initialize: ->
    unless App.playlist and App.playlist.get('_id') is @options.playlistId
      App.playlist = new App.Models.Playlist _id: @options.playlistId
      App.playlist.fetch()
      return @listenTo App.playlist, 'change', @render
    App.playlist.save()
    @render()
  render: ->
    @$el.html @template
      playlist: App.playlist.toJSON()

    @
