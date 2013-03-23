class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'playLast'
    'click .progress-bar': 'seek'
    'mouseenter .progress-bar': 'hoverBar'
    'mouseleave .progress-bar': 'leaveBar'
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
    @$progress = @$el.find '.progress-bar'
    @$position = @$el.find '.position-bar'
    @$seconds = @$el.find '.seconds'
  updateText: (obj) ->
    { title, album, duration } = obj
    @$el.find('h3').html title if title
    @$el.find('h4').html album if album
    @$el.find('.total').html toHHMMSS duration if duration
  pause: ->
    soundManager.pause "phish" + App.player.get('id')
  playButton: ->
    id = App.player.get('id')
    return soundManager.resume "phish#{id}" if @played.indexOf id >= 0
    App.player.play id
  playNext: ->
    App.queue.play()
  playLast: ->
    App.queue.playLast()
  updateProgress: (loaded, total) ->
    @$progress.width "#{(loaded/total)*100}%"
  updatePlaying: (position, duration) ->
    @$seconds.html toHHMMSS(position / 1000)
    @$position.css 'left', "#{(position/duration)*100}%"
  seek: (e) ->
    coord = e.pageX / $(window).width()
    return if App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord || e.pageX < 14
    App.player.sound.setPosition coord * App.song.get('duration') * 1000
  hoverBar: ->
    @$progress.stop().animate height: '7px', 300
    @$position.stop().animate height: '7px', 300
  leaveBar: ->
    @$progress.stop().animate height: '5px', 300
    @$position.stop().animate height: '5px', 300