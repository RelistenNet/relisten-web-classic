class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'playLast'
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
  updateText: (obj) ->
    { title, album, duration } = obj
    @$el.find('h3').html title if title
    @$el.find('h4').html album if album
    @$el.find('.total').html duration if duration
  pause: ->
    soundManager.pause "phish" + App.player.get('id')
    App.queue.playing = false
  playButton: ->
    id = App.player.get('id')
    App.queue.playing = true
    soundManager.resume "phish#{id}" if @played.indexOf id >= 0
  playNext: ->
    App.queue.play()
  playLast: ->
    App.queue.playLast()
