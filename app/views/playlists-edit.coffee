class App.Views.PlaylistsEdit extends App.Views.View
  className: 'playlists-edit-page'
  template: JST['playlists-edit']
  initialize: ->
    if !App.playlist or App.playlist.get('_id') isnt @options.playlistId
      App.playlist = new App.Models.Playlist _id: @options.playlistId
      App.playlist.fetch()
      return @listenTo App.playlist, 'change', @render
    App.playlist.set 'name', @$el.find('input').val()
    App.playlist.save()
    @render()
  render: ->
    @$el.html @template
      playlist: App.playlist.toJSON()

    @
