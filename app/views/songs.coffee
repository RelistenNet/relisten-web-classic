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
      band: @options.band
      year: @options.year
      month: @options.month
      day: @options.day
      version: @options.showVersion

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    console.log @folder.toJSON()
    App.router.clearActive()
    sources = @folder.get('data') if @folder
    return unless sources?.length

    console.log @options.showVersion
    if @options.showVersion
      @songs = sources[@options.showVersion]
    else
      @songs = sources[0]

    console.log @songs

    @$el.html @template
      songs: @songs
      sources: sources || []
      year: @options.year
      month: @options.month
      day: @options.day
      band: @options.band
      showVersion: @options.showVersion || ''

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
    idx = $li.attr 'data-idx'
    song = _.extend @songs.tracks[+idx], { band: @options.band, year: @options.year, month: @options.month, day: @options.day, showVersion: @options.showVersion }
    App.queue.push song

    false
  showSources: =>
    return @$sources.slideDown() if @$sources.is ':hidden'
    @$sources.slideUp()

