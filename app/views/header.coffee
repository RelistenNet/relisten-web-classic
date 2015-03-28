otherPages =
  today:
    name: "Today in History"
  chat:
    name: "People wax poetic about Jerry"

class App.Views.Header extends App.Views.View
  autoRender: true
  el: 'header'
  template: JST['header']
  events:
    'click .band': 'refreshBand'
  initialize: ->
    super
  render: (playlist) =>
    @$el.html @template
      loggedIn: App.user.loggedIn()
      slug: App.router?.band
      bandName: App.bands[App.router?.band]?.name || otherPages[App.router?.band]?.name
      the: App.bands[App.router?.band]?.the
  refreshBand: ->
    if Backbone.history.fragment is App.router?.band
      Backbone.history.loadUrl '/' + App.router?.band
    else
      App.router.navigate '/' + App.router?.band, trigger: true

