class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  initialize: ->
    if @options.folder
      @folder = new App.Models.Folder id: @options.folder
      @listenTo @folder, 'change', @render
      @folder.fetch()
    else
      @render()
  render: ->
    App.router.clearActive()
    @$el.html @template
      songs: if @folder then @folder.toJSON() else songs

    @