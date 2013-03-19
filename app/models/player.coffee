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
          App.playerView.updateText
            duration: @duration
    @updateText()

  updateText: ->
    id = @get 'id'
    if id
      children = if App.songsFolder then App.songsFolder.get('children') else songs.children
      song = _.findWhere children, { id: +id }
      App.playerView.updateText
        title: song.title
        album: song.album
