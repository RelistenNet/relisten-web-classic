class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
  initialize: ->
    soundManager.setup
      url: "/swf"
      useHTML5Audio: true
      onready: =>
        @render()
  render: ->
    @$el.html @template()
  play: ->
    soundManager.createSound
      id:'myMp3'
      url:'http://74.104.117.66:8044/stream?player=74&id=35787'
      autoLoad: true
      autoPlay: true