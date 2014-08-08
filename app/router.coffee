class App.Router extends Backbone.Router
  routes:
    '': 'index'
    'about': 'about'
    'login': 'login'
    'register': 'register'
    'playlists': 'playlists'
    'playlist/:id': 'playlist'
    'playlist/:id/edit': 'editPlaylist'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
   #@route /^playlist\/([0-9a-f]{24})\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'playlistSong'

    @route /^([A-Za-z]+)\/?$/, 'band'
    @route /^([A-Za-z]+)\/([0-9]{4})\/?$/, 'year'
    @route /^([A-Za-z]+)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, 'day'
    @route /^([A-Za-z]+)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/?$/, 'show'
    @route /^([A-Za-z]+)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'song'


    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @changeView(new App.Views.HomePage())
    App.years = new App.Views.Years()
    App.shows = new App.Views.Shows()
    App.songs = new App.Views.Songs()
    document.title = 'Listen to the Grateful Dead'
  band: (band) ->
    @changeView(new App.Views.HomePage())
    App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows()
    App.songs = new App.Views.Songs()
    document.title = 'Listen to the Grateful Dead'
  year: (band, year) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { band, year }
    App.songs.$el.empty() if App.songs
    document.title = "#{year} | Listen to the Grateful Dead"
  day: (@band, @year, @month, @day) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day }
    document.title = "#{@year}/#{@month}/#{@day} | Listen to the Grateful Dead"
  show: (@band, @year, @month, @day, @showVersion) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
    document.title = "#{@year}/#{@month}/#{@day} | Listen to the Grateful Dead"
  song: (@band, @year, @month, @day, @showVersion, @slug, @version, @time) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
      App.shows = new App.Views.Shows { @band, @year }
      App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
      return App.songs.listenToOnce App.songs.folder, 'change', @finishSong

    App.shows = new App.Views.Shows { @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year

    @finishSong()

  finishSong: =>
    self = @
    App.queue.on 'reset', ->
      ms = timeToMS self.time
      App.song = App.queue.findWhere { slug: self.slug }
      document.title = "#{App.song.get('title')} | #{self.year}/#{self.month}/#{self.day} | Listen to the Grateful Dead"
      App.queue.play App.song, ms
      App.queue.off 'reset'

    App.songs.songs.tracks.map (track) => _.extend track, { @band, @year, @month, @day, @showVersion }

    App.queue.reset App.songs.songs.tracks
  about: ->
    @changeView(new App.Views.AboutPage())
    document.title = 'About | Listen to the Grateful Dead'
  login: ->
    @changeView(new App.Views.LoginPage())
    document.title = 'Login | Listen to the Grateful Dead'
  register: ->
    @changeView(new App.Views.RegisterPage())
    document.title = 'Register | Listen to the Grateful Dead'
  playlist: (id) ->
    @changeView(new App.Views.PlaylistPage(playlistId: id))
    document.title = 'Playlist | Listen to the Grateful Dead'
  playlists: ->
    @changeView(new App.Views.PlaylistsPage(), false)
    document.title = 'Playlists | Listen to the Grateful Dead'
  playlistSong: (id, @year, @month, @day, @showVersion, @slug, @version, @time) ->
    if App.initial
      @changeView(new App.Views.PlaylistPage(playlistId: id))
      return App.playlist.on 'change', =>
        @finishPlaylistSong { year: +@year, month: +@month, day: +@day, showVersion: +@showVersion, @slug, version: +@version }, @time
        App.playlist.off 'change'
    @finishPlaylistSong { year: +@year, month: +@month, day: +@day, showVersion: +@showVersion, @slug, version: +@version }, @time

  finishPlaylistSong: (obj, time) ->
    App.queue.on 'reset', =>
      ms = timeToMS time
      App.song = App.queue.findWhere obj
      App.queue.play App.song, ms
      App.queue.off 'reset'
    App.queue.reset App.playlist.get('_songs')

  editPlaylist: (id) ->
    @changeView(new App.Views.PlaylistsEdit(playlistId: id), false)
  clearActive: ($current) ->
    $('header ul.right a').removeClass('active')
    if $current
      $current.addClass('active')
  changeView: (view, render = true) =>
    @$container.hide()
    @currentView.close() if @currentView

    if render
      view.render()
      resize()

    @currentView = view
    @$container.html(view.el).fadeIn('fast')
  notFound: ->
    @navigate '/', trigger: true
  _trackPageview: ->
    App.initial = false if App.initial
    url = Backbone.history.getFragment()
    return if @lastUrl is url
    @lastUrl = url
    ga('send', 'pageview', "/#{url}");
