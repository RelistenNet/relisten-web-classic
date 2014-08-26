class App.Collections.Queue extends App.Collections.Collection
  #localStorage: new Backbone.LocalStorage "Queue"
  model: App.Models.Song
  idx: 0
  initialize: ->
    @on 'add', => @play() if (@length is 1) || (@idx is @length - 1 and !App.player.get('playing'))
    @on 'reset', => @idx = 0

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
    { slug, title, year, month, day, showVersion, band } = App.song.toJSON()

    @notify title, "#{App.bands[band].name}\n#{year}/#{month}/#{day}"

    showVersionStr = if showVersion then '-' + showVersion else ''
    # If not on the URL already, go ahead!
    unless window.location.pathname.match "/#{band}/#{year}/#{month}/#{day}#{showVersionStr}/#{slug}"
      url = "/#{band}/#{year}/#{month}/#{day}#{showVersionStr}/#{slug}"
      document.title = "#{title} | #{year}/#{month}/#{day} | #{App.bands[band].name}| Relisten"
      Backbone.history.navigate url, trigger: false
      ga('send', 'pageview', "#{url}")
    App.queueView.render App.queueView.$el.find('ul').scrollTop()
    $('.song').removeClass 'active'
    $(".#{band}-#{year}-#{month}-#{day}#{showVersionStr}-#{slug}").addClass 'active'
    ++@idx
  playLast: ->
    return App.player.sound.setPosition 0 if App.player.sound.position > 10000
    @idx -= 2
    @idx = 0 if @idx < 0
    @play null, 0

  notify: (title, body) ->
    return unless window.Notification

    if Notification.permission is "granted"
      notification = new Notification(title, { body })

      setTimeout ->
        notification.close()
      , 2500
