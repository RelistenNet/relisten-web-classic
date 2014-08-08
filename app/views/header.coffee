class App.Views.Header extends App.Views.View
  autoRender: true
  el: 'header'
  template: JST['header']
  events:
    'click .band-select': 'chooseBand'
  initialize: ->
    super
  render: (playlist) =>
    @$el.html @template
      loggedIn: App.user.loggedIn()
      playlistId: playlist.get '_id' if playlist
  chooseBand: ->
    0