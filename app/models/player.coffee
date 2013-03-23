class App.Models.Player extends App.Models.Model
  play: (id) ->
    soundManager.stop "phish#{stopId}" if stopId = @get 'id'
    @set 'id', id
    App.playerView.played.push id
    soundManager.onready =>
      @sound = soundManager.createSound
        id: "phish#{id}"
        url: "http://74.104.117.66:8044/stream?player=74&id=#{id}"
      @sound.play
        whileloading: ->
          App.playerView.updateProgress @bytesLoaded, @bytesTotal
        whileplaying: ->
          App.playerView.updatePlaying @position, @duration
        onplay: =>
          @updateText()
          @slideDown()
        onfinish: ->
          @stop()
          App.playerView.playNext()

  updateText: ->
    id = @get 'id'
    if id
      App.playerView.updateText
        title: App.song.get 'title'
        album: App.song.get 'album'
        duration: App.song.get 'duration'

  slideDown: ->
    $player = $('.player-container')
    unless parseInt $player.css('margin-top') is 0
      $player.animate 'margin-top': 0, 1000
      $('.home-page .row-fluid').animate 'height': $(window).height() - 228, 1000
