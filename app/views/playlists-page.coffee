class App.Views.PlaylistsPage extends App.Views.View
  className: 'playlists-page'
  template: JST['playlists']
  initialize: ->
    @playlists ||= new App.Collections.Playlists()
    @listenTo @playlists, 'reset', @render
    @playlists.fetch reset: true
  render: ->
    @$el.html @template
      playlists: @playlists.toJSON()

    @
