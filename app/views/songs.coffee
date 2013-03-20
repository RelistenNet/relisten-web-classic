class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  initialize: ->
    return @render() unless @options.year || @options.month || @options.day

    @folder = new App.Models.Songs
      year: @options.year
      month: @options.month
      day: @options.day
      version: @options.version

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      songs: if @folder then @folder.toJSON() else songs

    @