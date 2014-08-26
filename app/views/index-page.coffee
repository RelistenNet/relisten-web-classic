class App.Views.IndexPage extends App.Views.View
  className: 'index-page'
  template: JST['index']
  initialize: (@options) ->
    super
  render: =>
    App.header.render()
    @$el.html @template
      bands: if @options?.realMusic then App.realMusic else App.bands
      default: Notification.permission == "default"
      realMusic: @options?.realMusic

    if Notification.permission == "default"
      @$el.find('.enable-notifications')[0].addEventListener 'click', (e) ->
        if Notification.permission == "default"
          Notification.requestPermission (permission) ->
            $(e.target).fadeOut()
            ga('send', 'event', 'notifications', 'enable', 'index button', if permission == "granted" then 1 else 0)
