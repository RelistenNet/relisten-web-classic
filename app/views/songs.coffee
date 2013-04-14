class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  events:
    'click .add': 'addToPlaylist'
    #'click .song': 'addShowToPlaylist'
    'click .play': 'play'
    'click .add-all': 'addAll'
  initialize: ->
    unless @options.year || @options.month || @options.day
      @folder = new App.Models.Songs songs
      return @render()
    @folder = new App.Models.Songs
      year: @options.year
      month: @options.month
      day: @options.day
      version: @options.showVersion || 0

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      songs: if @folder then @folder.toJSON() else songs

    @

  play: (e) ->
    id = $(e.target).parent().attr 'data-id'
    song = new App.Models.Song _id: id
    song.fetch success: -> App.queue.reset song

  addAll: ->
    App.queue.reset @folder.get('_songs') if App.queue.length is 0
    App.queue.add @folder.get('_songs')
  addShowToPlaylist: (e) ->
    $li = $(e.target).parent()
    id = $li.attr('data-id')
    songs = @folder.get('_songs')
    App.song = new App.Models.Song _.findWhere songs, _id: id
    App.queue.reset songs
    # { id, year, month, longDay, longSlug } = App.song.toJSON()
    @playing = !!"in the band" # true
    #Backbone.history.navigate "/#{year}/#{month}/#{longDay}/#{longSlug}", trigger: true
  addToPlaylist: (e) ->
    $li = $(e.target).parent()
    id = $li.attr 'data-id'
    App.song = new App.Models.Song _id: id
    App.song.fetch
      success: -> App.song.change()

    false
