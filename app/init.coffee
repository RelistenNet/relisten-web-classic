window.App =
  "Models": {}
  "Collections": {}
  "Views": {}
  "Controllers": {}
  "Router": {}
  "utils": {}

$ ->
  # Initialize App
  Tweezer = new Application().initialize()

  $(window).resize resize

  $(window).keydown (e) ->
    return if $("input,textarea").is(":focus")
    #space
    if e.keyCode is 32
      if App.queue.playing then App.footer?.pause() else App.footer?.playButton()
    #arrow left
    else if e.keyCode is 37
      App.footer.playLast()
    #arrow right
    else if e.keyCode is 39
      App.footer.playNext()
    else
      return true
    e.preventDefault()

# Bind to every ajax send
$(document).ajaxSend (e, xhr, options) ->
  token = csrf
  xhr.setRequestHeader("X-CSRF-Token", token) if token and !_.isEmpty(user)


resize = ->
  $('.home-page .row-fluid').height $(window).height() - 100 - parseInt($('footer').css('bottom'))

toHHMMSS = (seconds) ->
  sec_numb = parseInt(seconds)
  hours = Math.floor(sec_numb / 3600)
  minutes = Math.floor((sec_numb - (hours * 3600)) / 60)
  seconds = sec_numb - (hours * 3600) - (minutes * 60)
  #hours = "0" + hours  if hours < 10
  #minutes = "0" + minutes  if minutes < 10
  seconds = "0" + seconds  if seconds < 10
  hourStr = if hours then hours + ":" else ""
  time = hourStr + minutes + ":" + seconds
  time

# If num.length < 2, then add a leading zero
addZero = (num) ->
  return String("0" + num) if String(num).length < 2
  String num

timeToMS = (time) ->
  return 0 unless /m/.test time
  time = time.split 'm'
  min = +time[0]
  sec = +time[1]
  ((min * 60) + sec) * 1000

Handlebars.registerHelper "toHHMMSS", ->
  new Handlebars.SafeString toHHMMSS(@duration)

Handlebars.registerHelper "length", (arr) ->
  new Handlebars.SafeString arr.length

Handlebars.registerHelper "addZero", (num) ->
  new Handlebars.SafeString addZero(num)

Handlebars.registerHelper "ifEqual", (val1, val2, fn) ->
  fn() if val1 is val2

Handlebars.registerHelper "blurb", (arr, id) ->
  blurb = _.findWhere arr, _song: id if arr
  new Handlebars.SafeString if blurb?.text then blurb.text else ''

