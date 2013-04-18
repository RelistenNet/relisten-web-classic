class App.Views.AboutPage extends App.Views.View
  className: 'about-page'
  template: JST['about']
  initialize: ->
    App.router.clearActive($('header .about'))
  render: ->
    @$el.html @template()
    @
