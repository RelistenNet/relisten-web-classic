class App.Views.Queue extends App.Views.View
  el: '.queue-container'
  template: JST['queue']
  events:
    'click .save': 'savePlaylist'
    'click .song': 'play'
    'click .delete': 'removeFromQueue'
    'click .clear': 'clearQueue'
  initialize: ->
    App.queue = new App.Collections.Queue()
    @listenTo App.queue, 'add', @render
    @listenTo App.queue, 'reset', @render
    @render()
  render: (scrollTop, dontAnimateScroll) ->
    song = App.queue.at(App.queue.idx - 1)
    @$el.html @template
      queue: App.queue.toJSON()
      loggedIn: App.user.loggedIn()
      activeSlug: if App.queue then song?.get 'longSlug' else false

    @$ul = @$el.find 'ul'
    @$ul.scrollTop scrollTop if scrollTop
    return if dontAnimateScroll
    $active = @$ul.find('.active')
    return unless $active.length
    top = $active.position().top

    @$ul.animate scrollTop: top + @$ul.scrollTop() - 30, 1250
  savePlaylist: ->
    playlist = new App.Models.Playlist _songs: _.pluck(App.queue.toJSON(), '_id')
    playlist.save()
    @listenToOnce playlist, 'change', ->
      Backbone.history.navigate "/playlist/#{playlist.get('_id')}/edit", trigger: true
  play: (e) ->
    e.preventDefault()
    App.queue.idx = @$el.find('li').index $(e.target).parent()
    App.queue.play()
  removeFromQueue: (e) ->
     idx = @$el.find('.delete').index $(e.target)
     App.queue.remove App.queue.at(idx)
     App.queue.idx-- if idx < App.queue.idx
     @render @$ul.scrollTop(), true
  clearQueue: ->
    App.queue.reset()
    @render()

