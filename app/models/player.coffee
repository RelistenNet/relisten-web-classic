class App.Models.Player extends App.Models.Model
  play: (id, ms) ->
    soundManager.stop "phish#{stopId}" if stopId = @get 'id'
    @set 'id', id
    App.playerView.played.push id
    soundManager.onready =>
      @sound = soundManager.createSound
        id: "phish#{id}"
        url: "http://74.104.117.66:8044/stream?player=74&id=#{id}"
        position: ms || 0
      @sound.play
        whileloading: ->
          App.footer.updateProgress @bytesLoaded, @bytesTotal
        whileplaying: ->
          App.footer.updatePlaying @position, @duration
        onplay: =>
          @updateText()
          @slideDown()
        onfinish: ->
          @stop()
          App.footer.playNext()
          App.queue.playing = false if App.queue.idx is App.queue.length

  updateText: ->
    id = @get 'id'
    if id
      App.playerView.updateText
        title: App.song.get 'title'
        album: App.song.get 'album'
        duration: App.song.get 'duration'

  slideDown: ->
    $footer = $('footer')
    unless $footer.height() is 100
      $footer.animate 'height': 100, 1000
      $('.home-page .row-fluid').animate 'height': $(window).height() - 100, 1000
