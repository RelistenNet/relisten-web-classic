class App.Collections.Queue extends App.Collections.Collection
  localStorage: new Backbone.LocalStorage "Queue"
  model: App.Models.Song
  idx: 0
  initialize: ->
    @on 'add', => @play() if @length is 1
    @on 'reset', =>
      @play() if @length > 0
      @idx = 0
  play: (song) ->
    if song
      App.song = @at song
      @idx = @indexOf App.song if App.song
    else
      @idx = 0 if @idx is @length
      App.song = @at @idx++
    App.player.play App.song.get('id')
  playLast: ->
    @idx = @length - 1 if @idx-- is 0
    @play()
