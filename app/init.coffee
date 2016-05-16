unless Notification
  Notification = -> 0
  Notification.permission = false

bandsWithThe = ["duo", "bernie-worrell", "disco-biscuits", "drive-by-truckers", "g-nome", "grateful-dead", "jazz-mandolin-project", "phish", "sci", "smashing-pumpkins", "steve-kimock-band", "stringdusters", "tedeschi-trucks"]

bands = {"akron-family":{"name":"Akron/Family","shows":"37"},"american-babies":{"name":"American Babies","shows":"59"},"andrew-bird":{"name":"Andrew Bird","shows":"103"},"animal-collective":{"name":"Animal Collective","shows":"26"},"aru":{"name":"Aquarium Rescue Unit","shows":"171"},"aqueous":{"name":"Aqueous","shows":"117"},"assembly-of-dust":{"name":"Assembly of Dust","shows":"354"},"bela-fleck":{"name":"Bela Fleck and the Flecktones","shows":"416"},"ben-kweller":{"name":"Ben Kweller","shows":"29"},"duo":{"name":"Benevento Russo Duo","shows":"352"},"bernie-worrell":{"name":"Bernie Worrell Orchestra","shows":"27"},"the-big-wu":{"name":"The Big Wu","shows":"335"},"blues-traveler":{"name":"Blues Traveler","shows":"1,140"},"weir":{"name":"Bob Weir","shows":"95"},"the-breakfast":{"name":"The Breakfast","shows":"510"},"brothers-past":{"name":"Brothers Past","shows":"551"},"cabinet":{"name":"Cabinet","shows":"577"},"club-d-elf":{"name":"Club d'Elf","shows":"618"},"dark-star":{"name":"Dark Star Orchestra","shows":"631"},"the-dead":{"name":"The Dead","shows":"370"},"dead-and-company":{"name":"Dead & Company","shows":"77"},"the-decemberists":{"name":"The Decemberists","shows":"79"},"disco-biscuits":{"name":"Disco Biscuits","shows":"1,389"},"dispatch":{"name":"Dispatch","shows":"35"},"donna-the-buffalo":{"name":"Donna the Buffalo","shows":"842"},"dopapod":{"name":"Dopapod","shows":"554"},"drive-by-truckers":{"name":"Drive-By Truckers","shows":"806"},"egi":{"name":"EGi","shows":"34"},"elliott-smith":{"name":"Elliott Smith","shows":"96"},"everyone-orchestra":{"name":"Everyone Orchestra","shows":"158"},"fugazi":{"name":"Fugazi","shows":"18"},"furthur":{"name":"Furthur","shows":"1,026"},"g-nome":{"name":"G-Nome Project","shows":"5"},"g-love":{"name":"G. Love and Special Sauce","shows":"172"},"garage-a-trois":{"name":"Garage A Trois","shows":"83"},"god-street-wine":{"name":"God Street Wine","shows":"259"},"grace-potter":{"name":"Grace Potter","shows":"547"},"grateful-dead":{"name":"Grateful Dead","shows":"10,509"},"greensky-bluegrass":{"name":"Greensky Bluegrass","shows":"673"},"guster":{"name":"Guster","shows":"584"},"the-heavy-pets":{"name":"The Heavy Pets","shows":"187"},"stringdusters":{"name":"Infamous Stringdusters","shows":"529"},"jack-johnson":{"name":"Jack Johnson","shows":"158"},"jauntee":{"name":"The Jauntee","shows":"308"},"jazz-mandolin-project":{"name":"Jazz Mandolin Project","shows":"171"},"jerry-joseph":{"name":"Jerry Joseph and the Jackmormons","shows":"785"},"joe-russos-almost-dead":{"name":"Joe Russo's Almost Dead","shows":"175"},"john-kadlecik":{"name":"John Kadlecik","shows":"229"},"john-popper":{"name":"John Popper","shows":"73"},"keller-williams":{"name":"Keller Williams","shows":"945"},"kung-fu":{"name":"Kung Fu","shows":"306"},"kvhw":{"name":"KVHW","shows":"116"},"leftover-salmon":{"name":"Leftover Salmon","shows":"720"},"lettuce":{"name":"Lettuce","shows":"285"},"little-feat":{"name":"Little Feat","shows":"643"},"lotus":{"name":"Lotus","shows":"481"},"marco":{"name":"Marco Benevento","shows":"162"},"matisyahu":{"name":"Matisyahu","shows":"358"},"matt-pond-pa":{"name":"Matt Pond PA","shows":"15"},"max-creek":{"name":"Max Creek","shows":"2,040"},"moe":{"name":"moe.","shows":"3,168"},"mogwai":{"name":"Mogwai","shows":"221"},"the-motet":{"name":"The Motet","shows":"219"},"mmj":{"name":"My Morning Jacket","shows":"339"},"the-new-deal":{"name":"The New Deal","shows":"293"},"new-mastersounds":{"name":"The New Mastersounds","shows":"289"},"percy-hill":{"name":"Percy Hill","shows":"118"},"phil-lesh":{"name":"Phil Lesh and Friends","shows":"2,024"},"phish":{"name":"Phish","shows":"1,478"},"radiators":{"name":"The Radiators","shows":"1,272"},"railroad-earth":{"name":"Railroad Earth","shows":"1,463"},"raq":{"name":"Raq","shows":"361"},"ratdog":{"name":"Ratdog","shows":"927"},"ryan-adams":{"name":"Ryan Adams","shows":"545"},"smashing-pumpkins":{"name":"Smashing Pumpkins","shows":"1,109"},"sts9":{"name":"Sound Tribe Sector 9","shows":"663"},"spafford":{"name":"Spafford","shows":"101"},"spoon":{"name":"Spoon","shows":"62"},"steve-kimock":{"name":"Steve Kimock","shows":"327"},"steve-kimock-band":{"name":"Steve Kimock Band","shows":"509"},"strangefolk":{"name":"Strangefolk","shows":"786"},"sci":{"name":"String Cheese Incident","shows":"1,551"},"tea-leaf-green":{"name":"Tea Leaf Green","shows":"1,068"},"ted-leo":{"name":"Ted Leo and the Pharmacists","shows":"21"},"tedeschi-trucks":{"name":"Tedeschi Trucks Band","shows":"385"},"tenacious-d":{"name":"Tenacious D","shows":"41"},"twiddle":{"name":"Twiddle","shows":"300"},"umphreys":{"name":"Umphrey's McGee","shows":"2,515"},"the-walkmen":{"name":"The Walkmen","shows":"18"},"war-on-drugs":{"name":"The War on Drugs","shows":"43"},"warren-zevon":{"name":"Warren Zevon","shows":"112"},"ween":{"name":"Ween","shows":"529"},"the-werks":{"name":"The Werks","shows":"151"},"white-denim":{"name":"White Denim","shows":"27"},"yonder":{"name":"Yonder Mountain String Band","shows":"1,656"},"zebu":{"name":"Zebu","shows":"7"},"zero":{"name":"Zero","shows":"454"}}

for name, band of bands
  bands[name].the = true if bandsWithThe.indexOf(name) != -1

window.App =
  "Models": {}
  "Collections": {}
  "Views": {}
  "Controllers": {}
  "Router": {}
  "utils": {}
  "bands": bands
  "realMusic": {"akron-family":{"name":"Akron/Family","shows":35},"animal-collective":{"name":"Animal Collective","shows":23},"bela-fleck":{"name":"Béla Fleck and the Flecktones","shows":321},"ben-kweller":{"name":"Ben Kweller","shows":18},"bernie-worrell":{"name":"Bernie Worrell Orchestra","the":true,"shows":27},"club-d-elf":{"name":"Club d'Elf","shows":523},"the-decemberists":{"name":"The Decemberists","shows":74},"dispatch":{"name":"Dispatch","shows":32},"drive-by-truckers":{"name":"Drive-By Truckers","the":true,"shows":680},"elliott-smith":{"name":"Elliott Smith","shows":81},"fugazi":{"name":"Fugazi","shows":18},"g-love":{"name":"G. Love and Special Sauce","shows":124},"garage-a-trois":{"name":"Garage A Trois","shows":74},"grace-potter":{"name":"Grace Potter","the":true,"shows":488},"guster":{"name":"Guster","shows":484},"jack-johnson":{"name":"Jack Johnson","shows":146},"jerry-joseph":{"name":"Jerry Joseph and the Jackmormons","shows":604},"john-popper":{"name":"John Popper","shows":67},"little-feat":{"name":"Little Feat","shows":567},"matisyahu":{"name":"Matisyahu","shows":296},"matt-pond-pa":{"name":"Matt Pond PA","shows":8},"mmj":{"name":"My Morning Jacket","shows":253},"mogwai":{"name":"Mogwai","shows":164},"new-mastersounds":{"name":"The New Mastersounds","shows":197},"radiators":{"name":"The Radiators","shows":"1,163"},"ryan-adams":{"name":"Ryan Adams","shows":409},"smashing-pumpkins":{"name":"Smashing Pumpkins","the":true,"shows":"1,005"},"spoon":{"name":"Spoon","shows":51},"ted-leo":{"name":"Ted Leo and the Pharmacists","shows":20},"tenacious-d":{"name":"Tenacious D","shows":31},"the-walkmen":{"name":"The Walkmen","shows":18},"war-on-drugs":{"name":"The War on Drugs","shows":30},"warren-zevon":{"name":"Warren Zevon","shows":104},"ween":{"name":"Ween","shows":447},"white-denim":{"name":"White Denim","shows":24}  }
  "root": "http://iguana.app.alecgorge.com"
  isGapless: ->
    cookie("gapless") && gapless5AudioContext

#if /localhost/.test window.location.origin
#  window.App.root = "http://localhost:9000"

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

