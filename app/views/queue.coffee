class App.Views.Queue extends App.Views.View
  el: '.queue-container'
  template: JST['queue']
  events:
    'click .save': 'savePlaylist'
    'click .song': 'play'
  initialize: ->
    App.queue = new App.Collections.Queue()
    @listenTo App.queue, 'add', @render
    @listenTo App.queue, 'reset', @render
    @render()
  render: ->
    @$el.html @template
      queue: App.queue.toJSON()
      loggedIn: App.user.loggedIn()
  savePlaylist: ->
    playlist = new App.Models.Playlist _songs: _.pluck(App.queue.toJSON(), '_id')
    playlist.save()
    @listenToOnce playlist, 'change', ->
      Backbone.history.navigate "/playlist/#{playlist.get('_id')}/edit", trigger: true
  play: (e) ->
    e.preventDefault()
    App.queue.idx = @$el.find('li').index $(e.target).parent()
    App.queue.play()

