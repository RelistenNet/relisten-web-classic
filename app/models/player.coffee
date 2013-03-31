class App.Models.Player extends App.Models.Model
  play: (ms) ->
    id = App.song.get '_id'
    soundManager.stop "phish#{stopId}" if stopId = @get 'id'
    @set 'id', App.song.get '_id'
    App.playerView.played.push id
    soundManager.onready =>
      @sound = soundManager.createSound
        id: "phish#{id}"
        url: App.song.get 'url'
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
          App.playerView.playNext()
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
    unless parseInt $footer.css('bottom') is 0
      $footer.animate 'bottom': 0, 1000
      $('.home-page .row-fluid').animate 'height': $(window).height() - 150, 1000
