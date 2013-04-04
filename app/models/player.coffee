class App.Models.Player extends App.Models.Model
  play: (ms) =>
    @sound.destruct() if @sound
    @set 'id', id = App.song.get '_id'
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
          App.footer.playNext()
          App.queue.playing = false if App.queue.idx is App.queue.length

  updateText: ->
    if @get 'id'
      App.playerView.updateText
        title: App.song.get 'title'
        album: App.song.get 'album'
        duration: App.song.get 'duration'

  slideDown: ->
    $footer = $('footer')
    unless $footer.height() is 100
      $footer.animate 'height': 100, 1000
      $('.home-page .row-fluid').animate 'height': $(window).height() - 100, 1000
