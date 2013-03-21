class App.Views.Header extends App.Views.View
  autoRender: true
  el: 'header'
  template: JST['header']
  initialize: ->
    super
  render: (playlist) =>
    @$el.html @template
      loggedIn: App.user.loggedIn()
      playlistId: playlist.get '_id' if playlist