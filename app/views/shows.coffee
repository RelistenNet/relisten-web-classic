class App.Views.Shows extends App.Views.View
  el: '.shows-container'
  template: JST['shows']
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
      shows: if @folder then @folder.toJSON() else shows

    @