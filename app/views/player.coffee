class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  played: []
  events:
    'click .pause': 'pause'
    'click .play': 'playButton'
    'click .next': 'playNext'
    'click .last': 'last'
  initialize: ->
    soundManager.setup
      url: "/swf"
      useHTML5Audio: true
      onready: =>
        @render()
  render: ->
    @$el.html @template()
    App.player.updateText()
    @$progress = @$el.find '.progress-bar'
  updateText: (title, album) ->
    @$el.find('h3').html title
    @$el.find('h4').html album
  pause: ->
    soundManager.pause App.player.get('id')
  playButton: ->
    id = App.player.get('id')
    return soundManager.resume id if @played.indexOf id >= 0
    App.player.play id
  playNext: ->
    App.player.play +App.player.get('id') + 1
  last: ->
    App.player.play +App.player.get('id') - 1
  updateProgress: (loaded, total) ->
    @$progress.width "#{(loaded/total)*100}%"
