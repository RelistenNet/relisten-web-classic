unless Notification
  Notification = -> 0
  Notification.permission = false

window.App =
  "Models": {}
  "Collections": {}
  "Views": {}
  "Controllers": {}
  "Router": {}
  "utils": {}
  "bands": {"akron-family":{"name":"Akron/Family","shows":35},"animal-collective":{"name":"Animal Collective","shows":23},"aqueous":{"name":"Aqueous","shows":58},"aru":{"name":"Aquarium Rescue Unit","shows":103},"bela-fleck":{"name":"Béla Fleck and the Flecktones","shows":321},"ben-kweller":{"name":"Ben Kweller","shows":18},"duo":{"name":"Benevento Russo Duo","the":true,"shows":288},"bernie-worrell":{"name":"Bernie Worrell Orchestra","the":true,"shows":27},"the-big-wu":{"name":"The Big Wu","shows":252},"blues-traveler":{"name":"Blues Traveler","shows":"1,099"},"the-breakfast":{"name":"The Breakfast","shows":317},"weir":{"name":"Bob Weir","shows":80},"club-d-elf":{"name":"Club d'Elf","shows":523},"dark-star":{"name":"Dark Star Orchestra","shows":546},"the-decemberists":{"name":"The Decemberists","shows":74},"disco-biscuits":{"name":"Disco Biscuits","the":true,"shows":"1,251"},"dispatch":{"name":"Dispatch","shows":32},"dopapod":{"name":"Dopapod","shows":357},"drive-by-truckers":{"name":"Drive-By Truckers","the":true,"shows":680},"elliott-smith":{"name":"Elliott Smith","shows":81},"everyone-orchestra":{"name":"Everyone Orchestra","shows":123},"fugazi":{"name":"Fugazi","shows":18},"furthur":{"name":"Furthur","shows":972},"g-love":{"name":"G. Love and Special Sauce","shows":124},"g-nome":{"name":"G-Nome Project","the":true,"shows":4},"garage-a-trois":{"name":"Garage A Trois","shows":74},"god-street-wine":{"name":"God Street Wine","shows":240},"grace-potter":{"name":"Grace Potter","the":true,"shows":488},"grateful-dead":{"name":"Grateful Dead","the":true,"shows":"9,142"},"greensky-bluegrass":{"name":"Greensky Bluegrass","shows":462},"guster":{"name":"Guster","shows":484},"the-heavy-pets":{"name":"The Heavy Pets","shows":142},"jack-johnson":{"name":"Jack Johnson","shows":146},"jazz-mandolin-project":{"name":"Jazz Mandolin Project","the":true,"shows":163},"jerry-joseph":{"name":"Jerry Joseph and the Jackmormons","shows":604},"john-popper":{"name":"John Popper","shows":67},"keller-williams":{"name":"Keller Williams","shows":608},"kvhw":{"name":"KVHW","shows":109},"leftover-salmon":{"name":"Leftover Salmon","shows":542},"little-feat":{"name":"Little Feat","shows":567},"lotus":{"name":"Lotus","shows":368},"marco":{"name":"Marco Benevento","shows":136},"matisyahu":{"name":"Matisyahu","shows":296},"matt-pond-pa":{"name":"Matt Pond PA","shows":8},"max-creek":{"name":"Max Creek","shows":"1,850"},"mmj":{"name":"My Morning Jacket","shows":253},"moe":{"name":"moe.","shows":959},"mogwai":{"name":"Mogwai","shows":164},"the-motet":{"name":"The Motet","shows":166},"the-new-deal":{"name":"The New Deal","shows":241},"new-mastersounds":{"name":"The New Mastersounds","shows":197},"percy-hill":{"name":"Percy Hill","shows":102},"phil-lesh":{"name":"Phil Lesh and Friends","shows":"1,707"},"phish":{"name":"Phish","the":true,"shows":"1,420"},"radiators":{"name":"The Radiators","shows":"1,163"},"railroad-earth":{"name":"Railroad Earth","shows":"1,180"},"raq":{"name":"Raq","shows":290},"ratdog":{"name":"Ratdog","shows":831},"ryan-adams":{"name":"Ryan Adams","shows":409},"sci":{"name":"String Cheese Incident","the":true,"shows":932},"smashing-pumpkins":{"name":"Smashing Pumpkins","the":true,"shows":"1,005"},"spoon":{"name":"Spoon","shows":51},"steve-kimock":{"name":"Steve Kimock","shows":256},"steve-kimock-band":{"name":"Steve Kimock Band","the":true,"shows":441},"strangefolk":{"name":"Strangefolk","shows":727},"stringdusters":{"name":"Infamous Stringdusters","the":true,"shows":406},"tea-leaf-green":{"name":"Tea Leaf Green","shows":976},"ted-leo":{"name":"Ted Leo and the Pharmacists","shows":20},"tedeschi-trucks":{"name":"Tedeschi Trucks Band","the":true,"shows":239},"tenacious-d":{"name":"Tenacious D","shows":31},"umphreys":{"name":"Umphrey's McGee","shows":"2,024"},"the-walkmen":{"name":"The Walkmen","shows":18},"war-on-drugs":{"name":"The War on Drugs","shows":30},"warren-zevon":{"name":"Warren Zevon","shows":104},"ween":{"name":"Ween","shows":447},"white-denim":{"name":"White Denim","shows":24},"yonder":{"name":"Yonder Mountain String Band","shows":792},"zero":{"name":"Zero","shows":416}}
  "realMusic": {"akron-family":{"name":"Akron/Family","shows":35},"animal-collective":{"name":"Animal Collective","shows":23},"bela-fleck":{"name":"Béla Fleck and the Flecktones","shows":321},"ben-kweller":{"name":"Ben Kweller","shows":18},"bernie-worrell":{"name":"Bernie Worrell Orchestra","the":true,"shows":27},"club-d-elf":{"name":"Club d'Elf","shows":523},"the-decemberists":{"name":"The Decemberists","shows":74},"dispatch":{"name":"Dispatch","shows":32},"drive-by-truckers":{"name":"Drive-By Truckers","the":true,"shows":680},"elliott-smith":{"name":"Elliott Smith","shows":81},"fugazi":{"name":"Fugazi","shows":18},"g-love":{"name":"G. Love and Special Sauce","shows":124},"garage-a-trois":{"name":"Garage A Trois","shows":74},"grace-potter":{"name":"Grace Potter","the":true,"shows":488},"guster":{"name":"Guster","shows":484},"jack-johnson":{"name":"Jack Johnson","shows":146},"jerry-joseph":{"name":"Jerry Joseph and the Jackmormons","shows":604},"john-popper":{"name":"John Popper","shows":67},"little-feat":{"name":"Little Feat","shows":567},"matisyahu":{"name":"Matisyahu","shows":296},"matt-pond-pa":{"name":"Matt Pond PA","shows":8},"mmj":{"name":"My Morning Jacket","shows":253},"mogwai":{"name":"Mogwai","shows":164},"new-mastersounds":{"name":"The New Mastersounds","shows":197},"radiators":{"name":"The Radiators","shows":"1,163"},"ryan-adams":{"name":"Ryan Adams","shows":409},"smashing-pumpkins":{"name":"Smashing Pumpkins","the":true,"shows":"1,005"},"spoon":{"name":"Spoon","shows":51},"ted-leo":{"name":"Ted Leo and the Pharmacists","shows":20},"tenacious-d":{"name":"Tenacious D","shows":31},"the-walkmen":{"name":"The Walkmen","shows":18},"war-on-drugs":{"name":"The War on Drugs","shows":30},"warren-zevon":{"name":"Warren Zevon","shows":104},"ween":{"name":"Ween","shows":447},"white-denim":{"name":"White Denim","shows":24}  }
  "root": "http://localhost:9000"


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
  time = time.replace /s$/, ''
  time = time.split 'm'
  min = +time[0]
  sec = +time[1]
  ((min * 60) + sec) * 1000

App.utils.ordinal_suffix = (i) ->
  j = i % 10
  k = i % 100
  return i + "st"  if j is 1 and k isnt 11
  return i + "nd"  if j is 2 and k isnt 12
  return i + "rd"  if j is 3 and k isnt 13
  i + "th"

Handlebars.registerHelper "toHHMMSS", ->
  new Handlebars.SafeString toHHMMSS(@duration)

Handlebars.registerHelper "len", ->
  new Handlebars.SafeString toHHMMSS(@length)

Handlebars.registerHelper "length", (arr) ->
  return 0 unless arr
  new Handlebars.SafeString arr.length

Handlebars.registerHelper "addZero", (num) ->
  new Handlebars.SafeString addZero(num)

Handlebars.registerHelper "addOne", (num) ->
  new Handlebars.SafeString num + 1

Handlebars.registerHelper "newLine", (str) ->
  new Handlebars.SafeString $('<div/>').text(str.replace(/\n/g,'<br />')).html()

Handlebars.registerHelper "if_eq", (a, b, opts) ->
  if a is b
    opts.fn this
  else
    opts.inverse this

Handlebars.registerHelper "blurb", (arr, id) ->
  blurb = _.findWhere arr, _song: id if arr
  new Handlebars.SafeString if blurb?.text then blurb.text else ''

