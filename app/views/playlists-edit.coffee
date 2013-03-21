class App.Views.PlaylistsEdit extends App.Views.View
  className: 'playlists-edit-page'
  template: JST['playlists-edit']
  events:
    'click .save': 'save'
  initialize: ->
    App.playlist.save() if App.playlist
    App.playlist = new App.Models.Playlist _id: @options.playlistId
    #App.songsFolder.fetch() if App.songsFolder
    App.playlist.fetch()
    @listenToOnce App.playlist, 'change', @render
    App.header.render false
  render: ->
    @$el.html @template
      playlist: App.playlist.toJSON()

    @
  save: ->
    App.playlist.set 'name', @$el.find('input').val()
    App.playlist.save()
