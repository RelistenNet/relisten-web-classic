class App.Views.AboutPage extends App.Views.View
  className: 'about-page'
  template: JST['about']
  render: ->
    @$el.html @template()
    @
