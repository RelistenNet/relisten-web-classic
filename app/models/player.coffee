class App.Models.Player extends App.Models.Model
  initialize: ->
    @times = 0
    @on 'change:playing', (player, playing) ->
      if playing
        $('footer .play').removeClass('play').addClass 'pause'
      else
        $('footer .pause').removeClass('pause').addClass 'play'
  play: (ms = 0) =>
    return @times = 0 if @times > 4

    if @sound
      volume = @sound.volume
      @sound.destruct()

    @set 'id', id = App.song.get '_id'
    App.playerView.played.push id

    # Use ogg if it exists + can be played, otherwise use mp3
    canPlayOgg = soundManager.canPlayMIME 'audio/ogg'
    url = App.song.get 'file' unless canPlayOgg and url = App.song.get 'oggUrl'

    self = this

    soundManager.onready =>
      @sound = soundManager.createSound
        id: "phish#{id}"
        url: url
        position: ms
      @sound.play
        ondataerror: ->
          console.log 'error mate' if console
        whileloading: ->
          self.times = 0 if self.times > 0
          App.footer.updateProgress @bytesLoaded, @bytesTotal
        whileplaying: ->
          App.footer.updatePlaying @position, @duration
        onplay: =>
          @sound.setVolume volume || 100
          @updateText()
          @slideDown()
        onfinish: ->
          @stop()
          App.footer.playNext()
          App.player.set 'playing', false if App.queue.idx is App.queue.length
        onload: ->
          # on failed load
          self.play() if @readyState is 2 and self.times++ < 5

  updateText: ->
    if title = App.song?.get 'title'
      App.playerView.updateText
        title: title
        album: App.songs.songs.title
        length: App.song.get 'length'

  slideDown: ->
    $footer = $('footer')
    unless $footer.height() is 100
      $footer.animate 'height': 100, 1000
      $container = $('.page-container').animate 'height': $(window).height() - 100, 1000, ->
        $container.css 'overflow', 'auto'
