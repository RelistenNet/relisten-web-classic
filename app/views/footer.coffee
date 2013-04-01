class App.Views.Footer extends App.Views.View
  el: 'footer'
  template: JST['footer']
  events:
    'mouseenter .progress-container': 'hoverBar'
    'mousemove .progress-container': 'moveBar'
    'mouseleave .progress-container': 'leaveBar'
    'mousedown .progress-container': 'seekDown'
    'mouseup': 'mouseUp'
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
        App.player.play @_clickToMs(e.pageX)
    @dragging = false
  seek: (pageX) ->
    coord = pageX / $(window).width()
    App.player.sound.setPosition coord * @_timeStrToSec(App.song.get('duration')) * 1000
  _clickToMs: (pageX) ->
    coord = pageX / $(window).width()
    coord * @_timeStrToSec(App.song.get('duration')) * 1000
  _timeStrToSec: (str) ->
    duration = 0
    # Convert 3:45 to seconds
    for i, num of str.split(":").reverse()
      duration += num * Math.pow 60, i
    duration

