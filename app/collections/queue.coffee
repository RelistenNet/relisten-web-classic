class App.Collections.Queue extends App.Collections.Collection
  localStorage: new Backbone.LocalStorage "Queue"
  model: App.Models.Song
  idx: 0
  initialize: ->
    @on 'add', => @play() if (@length is 1) || (@idx is @length - 1 and !App.player.get('playing'))
    @on 'reset', =>
      @idx = 0

  play: (song, ms) =>
    if song
      @idx = @indexOf App.song if App.song
    else
      return App.footer.pause() if @idx is @length
      App.song = @at @idx

    return false unless App.song
    @invoke 'set', active: ''
    App.song.set 'active', 'active'

    App.player.play ms
    App.player.set 'playing', true
    { year, month, longDay, longSlug } = App.song.toJSON()
    # If not on the URL already, go ahead!
    unless "/#{year}/#{month}/#{longDay}/#{longSlug}".match window.location.pathname
      url = "/#{year}/#{month}/#{longDay}/#{longSlug}"
      Backbone.history.navigate url, trigger: false
      ga('send', 'pageview', "#{url}")
    App.queueView.render App.queueView.$el.find('ul').scrollTop()
    ++@idx
  playLast: ->
    return App.player.sound.setPosition 0 if App.player.sound.position > 10000
    @idx -= 2
    @idx = 0 if @idx < 0
    @play null, 0
