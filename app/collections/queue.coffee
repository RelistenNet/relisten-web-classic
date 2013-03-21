class App.Collections.Queue extends App.Collections.Collection
  model: App.Models.Song
  idx: 0
  initialize: ->
    @on 'add', => @play() if @length is 1
    @on 'reset', =>
      @play() if @length > 0
      @idx = 0
  play: ->
    @idx = 0 if @idx is @length
    App.song = @at @idx++
    App.player.play App.song.get('id')
  playLast: ->
    --@idx
    @play()
