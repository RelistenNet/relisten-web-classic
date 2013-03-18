class App.Views.Years extends App.Views.View
  el: '.year-container'
  template: JST['years']
  initialize: ->
    @folder = new App.Models.Folder id: @options.folder
    @render()
  render: ->
    App.router.clearActive()
    @$el.html @template
      years: years

    @