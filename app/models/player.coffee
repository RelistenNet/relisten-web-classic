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
    App.player.updateText()
  updateText: ->
    id = @get 'id'
    if id
      $.getJSON "/api/v1/song/#{id}", (song) =>
        App.playerView.updateText song.entry.title, song.entry.album