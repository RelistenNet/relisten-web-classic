class App.Models.Player extends App.Models.Model
  localStorage: new Backbone.LocalStorage "NowPlaying"
  play: (id) ->
    soundManager.stop @get 'id' if @get 'id'
    @set 'id', id
    App.playerView.played.push id
    @sound = soundManager.createSound
      id: "#{id}"
      url: "http://74.104.117.66:8044/stream?player=74&id=#{id}"
    @sound.play
      whileloading: ->
        App.playerView.updateProgress @bytesLoaded, @bytesTotal
      whileplaying: ->
        App.playerView.updatePlaying @position, @duration
        unless @loaded
          App.playerView.updateText { @duration }
      onfinish: ->
        App.playerView.playNext()
    @updateText()

  updateText: ->
    id = @get 'id'
    if id
      App.playerView.updateText
        title: App.song.get 'title'
        album: App.song.get 'album'
