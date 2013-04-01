class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'playLast'
    'mousedown .volume-container': 'volume'
    'mouseup': 'clickUp'
    'mousemove .volume-container': 'volumeMove'
  initialize: ->
    soundManager.setup
      url: "/swf"
      useHTML5Audio: true
      preferFlash: false
      debugMode: false
    @render()
  render: ->
    @$el.html @template()
    App.player.updateText()
    @$seconds = @$el.find '.seconds'
    @$volumeContainer = @$el.find '.volume-container'
    @$volume = @$volumeContainer.find '.volume'
  updateText: (obj) ->
    { title, album, duration } = obj
    @$el.find('h3').html title if title
    @$el.find('h4').html album if album
    @$el.find('.total').html toHHMMSS duration if duration
  pause: ->
    soundManager.pause "phish" + App.player.get('id')
    App.queue.playing = false
    $('footer .pause').removeClass('pause').addClass 'play'
  playButton: ->
    id = App.player.get('id')
    App.queue.playing = true
    $('footer .play').removeClass('play').addClass 'pause'
    return soundManager.resume "phish#{id}" if @played.indexOf id >= 0
    App.player.play id
  playNext: ->
    App.queue.play()
  playLast: ->
    App.queue.playLast()
  volume: (e) =>
    @setVolume e.pageY
    @dragging = true
  clickUp: (e) =>
    @dragging = false
  volumeMove: (e) =>
    @setVolume e.pageY if @dragging
  setVolume: (pageY) =>
    vol = 100 - (pageY - @$volumeContainer.offset().top) / @$volumeContainer.height() * 100
    App.player.sound.setVolume vol
    @$volume.height "#{vol}%"
