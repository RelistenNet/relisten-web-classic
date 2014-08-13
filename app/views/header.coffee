
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
      slug: App.router?.band
      bandName: App.bands[App.router?.band]?.name
      the: App.bands[App.router?.band]?.the
