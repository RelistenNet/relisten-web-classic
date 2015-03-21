class App.Views.OopsPage extends App.Views.View
  className: 'oops-page'
  template: JST['oops']
  initialize: ->
    App.router.clearActive($('header .fucked-up'))
  render: ->
    @$el.html @template(enabled: cookie("oops"))
    @