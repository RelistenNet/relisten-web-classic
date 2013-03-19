class App.Views.Player extends App.Views.View
  el: '.player-container'
  template: JST['player']
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
  play: (id) ->
    soundManager.stop App.currentlyPlaying if App.currentlyPlaying
    App.currentlyPlaying = id
    soundManager.createSound
      id: "#{id}"
      url: "http://74.104.117.66:8044/stream?player=74&id=#{id}"
      autoLoad: true
      autoPlay: true
    $.getJSON "/api/v1/song/#{id}", (song) =>
      @$el.find('h3').html song.entry.title
      @$el.find('h4').html song.entry.album
  pause: ->
    soundManager.pause App.currentlyPlaying
  playButton: ->
    soundManager.play App.currentlyPlaying
  playNext: ->
    console.log App.currentlyPlaying
    @play +App.currentlyPlaying + 1
  last: ->
    @play +App.currentlyPlaying - 1
