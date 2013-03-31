class App.Views.Footer extends App.Views.View
  el: 'footer'
  template: JST['footer']
  events:
    'mouseenter .progress-bar': 'hoverBar'
    'mouseleave .progress-bar': 'leaveBar'
    'click .progress-bar': 'seek'
    'click .progress-container': 'seekAhead'
  initialize: ->
    @$progress = @$el.find '.progress-bar'
    @$position = @$el.find '.position-bar'
  hoverBar: ->
    @$progress.stop().animate height: '7px', 300
    @$position.stop().animate height: '7px', 300
  leaveBar: ->
    @$progress.stop().animate height: '5px', 300
    @$position.stop().animate height: '5px', 300
  updateProgress: (loaded, total) ->
    @$progress.width "#{(loaded/total)*100}%"
  updatePlaying: (position, duration) ->
    App.playerView.$seconds.html toHHMMSS(position / 1000)
    @$position.css 'left', "#{(position/duration)*100}%"
  seek: (e) ->
    coord = e.pageX / $(window).width()
    #return if App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord
    App.player.sound.setPosition coord * App.song.get('duration') * 1000
  seekAhead: (e) ->
    coord = e.pageX / $(window).width()
    return if App.player.sound.bytesLoaded / App.player.sound.bytesTotal > coord
    position = coord * App.song.get('duration') * 1000
    App.player.sound.destruct()
    App.player.play App.song.get('id'), position
