class App.Views.Shows extends App.Views.View
  el: '.shows-container'
  template: JST['shows']
  initialize: ->
    @folder = new App.Models.Folder id: 36
    @folder.fetch()
    @listenTo @folder, 'change', @render
  render: =>
    @checkErr()
    App.router.clearActive()
    @$el.html @template
      loggedIn: App.user.loggedIn()
      shows: shows

    @
  checkErr: ->
    if window.location.search
      params = App.utils.getURLParameters(window.location.search)
      switch params.err
        # title, message, sticky (boolean), length (milliseconds)
        when "maxProviders" then App.notify.send('Error', "This is how you send an error notification.", false, 4000)
