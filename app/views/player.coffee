class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'last'
    'click': 'seek'
  initialize: ->
    soundManager.setup
      url: "/swf"
      useHTML5Audio: true
      onready: =>
        @render()
  render: ->
    @$el.html @template()
    App.player.updateText()
    @$progress = @$el.find '.progress-bar'
    @$position = @$el.find '.position-bar'
    @$seconds = @$el.find '.seconds'
  updateText: (title, album) ->
    @$el.find('h3').html title
    @$el.find('h4').html album
  pause: ->
    soundManager.pause App.player.get('id')
  playButton: ->
    id = App.player.get('id')
    return soundManager.resume id if @played.indexOf id >= 0
    App.player.play id
  playNext: ->
    App.player.play +App.player.get('id') + 1
  last: ->
    App.player.play +App.player.get('id') - 1
  updateProgress: (loaded, total) ->
    @$progress.width "#{(loaded/total)*100}%"
  updatePlaying: (position, duration) ->
    @duration = duration
    @$seconds.html toHHMMSS(position / 1000)
    @$position.css 'left', "#{(position/duration)*100}%"
  seek: (e) ->
    coord = e.pageX / $(window).width()
    return if App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord
    App.player.sound.setPosition coord * @duration
