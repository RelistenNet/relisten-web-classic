class App.Views.Shows extends App.Views.View
  el: '.shows-container'
  template: JST['shows']
  events:
    'click a': 'activate'
  initialize: ->
    unless @options.year
      @shows = new App.Models.Shows shows
      return @render()

    @shows = new App.Models.Shows year: @options.year
    @listenTo @shows, 'change', @render
    @shows.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      shows: if @shows then @shows.toJSON() else shows

    @$a = @$el.find('a')
    @$a.removeClass 'active'

    @
  activate: (e) =>
    @$a.removeClass 'active'
    $(e.target).addClass 'active'
