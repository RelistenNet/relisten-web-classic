class App.Views.Years extends App.Views.View
  el: '.years-container'
  template: JST['years']
  initialize: ->
    return @render() unless @options.folder
    @folder = new App.Models.Folder id: @options.folder
    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      years: if @folder then @folder.toJSON() else years

    @