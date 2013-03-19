class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  initialize: ->
    return @render() unless @options.folder

    App.songsFolder = @folder = new App.Models.Show
      year: @options.year
      month: @options.month
      day: @options.day

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      songs: if @folder then @folder.toJSON() else songs

    @