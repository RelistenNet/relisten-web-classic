class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  events:
    'click .add': 'addToPlaylist'
    'click .song': 'clickSong'
    'click .play': 'play'
    'click .add-all': 'addAll'
    'click .select-source': 'showSources'
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
    App.router.clearActive()
    sources = @folder.get('data') if @folder
    return unless sources?.length

    @songs = sources[@options.showVersion || 0]
    sources[@options.showVersion || 0].hidden = true

    { band, year, month, day, showVersion } = App.router
    @songs.tracks.map (track) => _.extend track, { band, year, month, day, showVersion }

    @$el.html @template
      songs: @songs
      sources: sources || []
      year: @options.year
      month: @options.month
      day: @options.day
      band: @options.band
      showVersion: @options.showVersion || ''
      multipleSources: sources.length > 1
      totalSources: sources.length

    @$sources = @$el.find '.source'

    @

  play: (e) ->
    id = $(e.target).parent().attr 'data-id'
    song = new App.Models.Song _id: id
    song.fetch success: -> App.queue.reset song

  addAll: ->
    App.queue.reset @songs.tracks if App.queue.length is 0
    App.queue.add @songs.tracks
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

  clickSong: (e) ->
    if Notify.needsPermission
      Notify.requestPermission(console.log, console.log)

