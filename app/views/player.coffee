class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
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
    { title, album, length } = obj
    @$el.find('h3').html title || ''
    @$el.find('h4').html album || ''
    @$el.find('.total').html if length then toHHMMSS length else "0:00"
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
