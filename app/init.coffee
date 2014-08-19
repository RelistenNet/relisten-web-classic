window.App =
  "Models": {}
  "Collections": {}
  "Views": {}
  "Controllers": {}
  "Router": {}
  "utils": {}
  "bands": {"animal-collective":{"name":"Animal Collective","the":false},"aqueous":{"name":"Aqueous","the":false},"aru":{"name":"Aquarium Rescue Unit","the":false},"bela-fleck":{"name":"Bela Fleck and the Flecktones","the":false},"ben-kweller":{"name":"Ben Kweller","the":false},"bernie-worrell":{"name":"Bernie Worrell Orchestra","the":true},"the-big-wu":{"name":"The Big Wu","the":false},"the-breakfast":{"name":"The Breakfast","the":false},"weir":{"name":"Bob Weir","the":false},"dark-star":{"name":"Dark Star Orchestra","the":false},"disco-biscuits":{"name":"Disco Biscuits","the":true},"dispatch":{"name":"Dispatch","the":false},"dopapod":{"name":"Dopapod","the":false},"duo":{"name":"Benevento Russo Duo","the":true},"everyone-orchestra":{"name":"Everyone Orchestra","the":true},"fugazi":{"name":"Fugazi","the":false},"furthur":{"name":"Furthur","the":false},"g-love":{"name":"G. Love and Special Sauce","the":false},"g-nome":{"name":"G-Nome Project","the":true},"garage-a-trois":{"name":"Garage A Trois","the":false},"god-street-wine":{"name":"God Street Wine","the":false},"grace-potter":{"name":"Grace Potter","the":true},"grateful-dead":{"name":"Grateful Dead","the":true},"greensky-bluegrass":{"name":"Greensky Bluegrass","the":false},"guster":{"name":"Guster","the":false},"the-heavy-pets":{"name":"The Heavy Pets","the":false},"john-popper":{"name":"John Popper","the":false},"keller-williams":{"name":"Keller Williams","the":false},"kvhw":{"name":"KVHW","the":false},"lotus":{"name":"Lotus","the":false},"marco":{"name":"Marco Benevento","the":false},"matisyahu":{"name":"Matisyahu","the":false},"max-creek":{"name":"Max Creek","the":false},"moe":{"name":"moe.","the":false},"the-new-deal":{"name":"The New Deal","the":false},"phil-lesh":{"name":"Phil Lesh and Friends","the":false},"radiators":{"name":"The Radiators","the":false},"railroad-earth":{"name":"Railroad Earth","the":false},"raq":{"name":"Raq","the":false},"ratdog":{"name":"Ratdog","the":false},"sci":{"name":"String Cheese Incident","the":true},"smashing-pumpkins":{"name":"Smashing Pumpkins","the":true},"spoon":{"name":"Spoon","the":false},"steve-kimock":{"name":"Steve Kimock","the":false},"steve-kimock-band":{"name":"Steve Kimock Band","the":true},"stringdusters":{"name":"Infamous Stringdusters","the":true},"tedeschi-trucks":{"name":"Tedeschi Trucks Band","the":true},"umphreys":{"name":"Umphrey's McGee","the":false},"ween":{"name":"Ween","the":false},"yonder":{"name":"Yonder Mountain String Band","the":false},"zero":{"name":"Zero","the":false}}
  "root": "http://iguana.relisten.net"


$ ->
  # Initialize App
  Tweezer = new Application().initialize()

  $(window).resize resize

  $(window).keydown (e) ->
    return if $("input,textarea").is(":focus")
    #space
    if e.keyCode is 32
      if App.player.get 'playing' then App.footer?.pause() else App.footer?.playButton()
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
  $('.page-container').height($(window).height() - $('footer').height())
    .css 'overflow', 'auto'

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

Handlebars.registerHelper "len", ->
  new Handlebars.SafeString toHHMMSS(@length)

Handlebars.registerHelper "length", (arr) ->
  return 0 unless arr
  new Handlebars.SafeString arr.length

Handlebars.registerHelper "addZero", (num) ->
  new Handlebars.SafeString addZero(num)

Handlebars.registerHelper "ifEqual", (val1, val2, fn) ->
  fn() if val1 is val2

Handlebars.registerHelper "blurb", (arr, id) ->
  blurb = _.findWhere arr, _song: id if arr
  new Handlebars.SafeString if blurb?.text then blurb.text else ''

