class App.Views.Shows extends App.Views.View
  el: '.shows-container'
  template: JST['shows']
  events:
    'click a': 'activate'
  initialize: ->
    return unless @options.band

    unless @options.year
      @shows = new App.Models.Shows @options.band,shows
      return @render()

    @shows = new App.Models.Shows band: @options.band, year: @options.year
    @listenTo @shows, 'change', @render
    @shows.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      data: if @shows then @shows.toJSON() else shows
      band: @options.band

    @$a = @$el.find('a')

    @$a.filter(".show-#{App.router.year}-#{App.router.month}-#{App.router.day}").addClass 'active'

    @
  activate: (e) =>
    @$a = @$el.find('a') unless @$a
    @$a.removeClass 'active'
    $(e.target).addClass 'active'
