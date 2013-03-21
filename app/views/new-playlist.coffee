class App.Views.NewPlaylist extends App.Views.View
  initialize: ->
    App.playlist = new App.Models.Playlist()
    @listenToOnce App.playlist, 'change', App.header.render
    App.playlist.save()
    $('.home-page').addClass 'new-playlist'
