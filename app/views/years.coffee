class App.Views.Years extends App.Views.View
  el: '.years-container'
  template: JST['years']
  events:
    'click a': 'activate'
  initialize: ->
    @options.band = 'dead' unless @options.band

    @years = new App.Models.Years band: @options.band
    @listenTo @years, 'change', @render
    @years.fetch()
  render: ->
    console.log @years.get 'data'
    App.router.clearActive()
    @$el.html @template
      years: @years.get 'data'
      band: @options.band

    @$a = @$el.find 'a'

    @
  activate: (e) =>
    @$a.removeClass 'active'
    $(e.target).addClass 'active'
