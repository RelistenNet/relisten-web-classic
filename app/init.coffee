window.App =
  "Models": {}
  "Collections": {}
  "Views": {}
  "Controllers": {}
  "Router": {}
  "utils": {}

$ ->
  $.getJSON '/api/v1/me/csrf', (data) ->
    App.csrf = data.csrf
  # Initialize App
  Tweezer = new Application().initialize()

  $(window).resize resize

resize = ->
  $('.home-page .row-fluid').height $(window).height() - 100