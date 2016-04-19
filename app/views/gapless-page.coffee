class App.Views.GaplessPage extends App.Views.View
  className: 'gapless-page'
  template: JST['gapless']
  initialize: ->
    App.router.clearActive($('header .gapless'))
  events:
    'click .enable-gapless': 'gapless'
  render: ->
    @$el.html @template(enabled: cookie("gapless"))
    @
  gapless: ->
    enabled = cookie("gapless")
    deleteCookie "gapless"
    cookie "gapless", !enabled, 1024
    ga('send', 'event', 'gapless', 'enable', 'button', if !enabled then 1 else 0)

    @render()
    location.reload()
