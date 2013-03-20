class App.Views.PlaylistsPage extends App.Views.View
  className: 'playlists-page'
  template: JST['playlists']
  initialize: ->
    App.playlists = new App.Collections.Playlists()
    App.playlists.fetch()
    @listenTo App.playlists, 'change', @render
  render: =>
    @$el.html @template
      playlists: App.playlists.toJSON()

    @
