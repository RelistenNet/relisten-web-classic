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

toHHMMSS = (seconds) ->
  sec_numb = parseInt(seconds)
  hours = Math.floor(sec_numb / 3600)
  minutes = Math.floor((sec_numb - (hours * 3600)) / 60)
  seconds = sec_numb - (hours * 3600) - (minutes * 60)
  hours = "0" + hours  if hours < 10
  minutes = "0" + minutes  if minutes < 10
  seconds = "0" + seconds  if seconds < 10
  time = hours + ":" + minutes + ":" + seconds
  time