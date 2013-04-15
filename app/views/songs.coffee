class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  events:
    'click .add': 'addToPlaylist'
    #'click .song': 'addShowToPlaylist'
    'click .play': 'play'
    'click .add-all': 'addAll'
    'click .show-sources': 'showSources'
  initialize: ->
    unless @options.year || @options.month || @options.day
      @folder = new App.Models.Songs songs
      return @render()
    @folder = new App.Models.Songs
      year: @options.year
      month: @options.month
      day: @options.day
      version: @options.showVersion

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @songs = @folder.get 'show' if @folder
    sources = @folder.get '_shows' if @folder and @songs
    @songs = @folder.toJSON() if @folder and !@songs

    @$el.html @template
      songs: @songs
      sources: sources || []

    @$sources = @$el.find '.source'

    @

  play: (e) ->
    id = $(e.target).parent().attr 'data-id'
    song = new App.Models.Song _id: id
    song.fetch success: -> App.queue.reset song

  addAll: ->
    App.queue.reset @songs._songs if App.queue.length is 0
    App.queue.add @songs._songs
  addShowToPlaylist: (e) ->
    $li = $(e.target).parent()
    id = $li.attr('data-id')
    App.song = new App.Models.Song _.findWhere @songs._songs, _id: id
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
  showSources: =>
    return @$sources.slideDown() if @$sources.is ':hidden'
    @$sources.slideUp()

