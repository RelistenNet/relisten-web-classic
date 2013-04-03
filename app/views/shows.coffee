class App.Views.Shows extends App.Views.View
  el: '.shows-container'
  template: JST['shows']
  events:
    'click a': 'activate'
  initialize: ->
    return @render() unless @options.year

    @shows = new App.Models.Shows year: @options.year
    @listenTo @shows, 'change', @render
    @shows.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      shows: if @shows then @shows.toJSON() else shows

    @$a = @$el.find('a').removeClass 'active'

    @
  activate: (e) =>
    @$a.removeClass 'active'
    $(e.target).addClass 'active'
