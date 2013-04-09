class App.Models.Player extends App.Models.Model
  defaults:
    playing: false
  initialize: ->
    @on 'change:playing', (player, playing) ->
      if playing
        $('footer .play').removeClass('play').addClass 'pause'
      else
        $('footer .pause').removeClass('pause').addClass 'play'
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
          App.player.set 'playing', false if App.queue.idx is App.queue.length

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
      $container = $('.page-container').animate 'height': $(window).height() - 100, 1000, ->
        $container.css 'overflow', 'auto'
