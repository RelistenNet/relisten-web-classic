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
      return App.playerView.pause() if @idx is @length
      App.song = @at @idx++
    return false unless App.song
    { id, year, month, day, showVersion, slug, version } = App.song.toJSON()
    App.player.play id
    showVersionStr = if showVersion then "-#{showVersion}" else ''
    songVersionStr = if version then "/#{songVersion}" else ''
    Backbone.history.navigate "/#{year}/#{month}/#{day}#{showVersionStr}/#{slug}#{songVersionStr}", trigger: false
  playLast: ->
    @idx = @idx - 2
    @idx = 0 if @idx < 0
    @play()
