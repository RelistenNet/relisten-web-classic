class App.Views.Footer extends App.Views.View
  el: 'footer'
  template: JST['footer']
  events:
    'mouseenter .progress-container': 'hoverBar'
    'mousemove .progress-container': 'moveBar'
    'mouseleave .progress-container': 'leaveBar'
    'mousedown .progress-container': 'seekDown'
    'mouseup': 'mouseUp'
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'playLast'
  initialize: ->
    @$progress = @$el.find '.progress-bar'
    @$container = @$el.find '.progress-container'
    @$position = @$el.find '.position-bar'
  hoverBar: (e) ->
    @$progress.stop().animate height: '10px', 300
    @$container.stop().animate height: '10px', 300
    @$position.stop().animate height: '10px', 300
  moveBar: (e) ->
    time = toHHMMSS @_clickToMs(e.pageX) / 1000
    App.playerView.$seconds.html time

    @seek e.pageX if @dragging
  leaveBar: ->
    @$progress.stop().animate height: '8px', 300
    @$position.stop().animate height: '8px', 300
    @$container.stop().animate height: '8px', 300
    @$container.off 'mousemove'
  updateProgress: (loaded, total) ->
    @$progress.width "#{(loaded/total)*100}%"
  updatePlaying: (position, duration) ->
    App.playerView.$seconds.html toHHMMSS(position / 1000) unless @$container.is ":hover"
    @$position.css 'left', "#{(position/duration)*100}%"
  seekDown: (e) ->
    @seek e.pageX
    @dragging = true
  mouseUp: (e) =>
    if @dragging
      coord = e.pageX / $(window).width()
      if App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord
        App.player.sound.destruct()
        App.player.play  @_clickToMs(e.pageX)
    @dragging = false
  seek: (pageX) ->
    coord = pageX / $(window).width()
    App.player.sound.setPosition coord * App.song.get('duration') * 1000

  pause: ->
    soundManager.pause "phish" + App.player.get('id')
    App.player.set 'playing', false
  playButton: ->
    id = App.player.get('id')
    App.player.set 'playing', true
    return soundManager.resume "phish#{id}" if App.playerView.played.indexOf id >= 0
    App.player.play()
  playNext: ->
    App.queue.play null, 0
  playLast: ->
    App.queue.playLast()

  _clickToMs: (pageX) ->
    coord = pageX / $(window).width()
    coord * App.song.get('duration') * 1000
