class App.Views.Years extends App.Views.View
  autoRender: true
  el: '.years-container'
  template: JST['years']
  render: ->
    App.router.clearActive()
    @$el.html @template
      years: years

    @