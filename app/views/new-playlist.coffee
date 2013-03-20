class App.Views.NewPlaylist extends App.Views.View
  initialize: ->
    App.playlist = new App.Models.Playlist()
    App.playlist.save()
    $('.home-page').addClass 'new-playlist'
    @listenTo App.playlist, 'change', App.header.render
