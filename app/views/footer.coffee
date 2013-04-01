class App.Views.Footer extends App.Views.View
  el: 'footer'
  template: JST['footer']
  events:
    'mouseenter .progress-container': 'hoverBar'
    'mousemove .progress-container': 'moveBar'
    'mouseleave .progress-container': 'leaveBar'
    'click .progress-bar': 'seek'
    'click .progress-container': 'seekAhead'
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
  seek: (e) ->
    coord = e.pageX / $(window).width()
    #return if App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord
    App.player.sound.setPosition coord * App.song.get('duration') * 1000
  seekAhead: (e) ->
    App.player.sound.destruct()
    App.player.play @_clickToMs(e.pageX)
  _clickToMs: (pageX) ->
    coord = pageX / $(window).width()
    coord * App.song.get('duration') * 1000
