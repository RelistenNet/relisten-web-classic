class App.Router extends Backbone.Router
  routes:
    '': 'index'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
   #@route /^playlist\/([0-9a-f]{24})\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'playlistSong'

    @route /^about\/?$/, 'about'
    @route /^([a-z]+(?:-[a-z]+)*)\/?$/, 'band'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/?$/, 'year'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, 'day'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/?$/, 'show'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'song'

    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @band = ''
    @changeView(new App.Views.IndexPage())
    document.title = 'Relisten'
  band: (@band) ->
    @changeView(new App.Views.HomePage())
    App.years = new App.Views.Years { band }
    #App.shows = new App.Views.Shows()
    #App.songs = new App.Views.Songs()
    App.header.render()
    document.title = 'Relisten'
  year: (@band, @year) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { band, year }
    App.songs.$el.empty() if App.songs
    App.header.render()
    document.title = "#{year} | Relisten"
  day: (@band, @year, @month, @day) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day }
    App.header.render()
    document.title = "#{@year}/#{@month}/#{@day} | Relisten"
  show: (@band, @year, @month, @day, @showVersion) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { @band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
    App.header.render()
    document.title = "#{@year}/#{@month}/#{@day} | Relisten"
  song: (@band, @year, @month, @day, @showVersion, @slug, @version, @time) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { @band }
      App.shows = new App.Views.Shows { @band, @year }
      App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
      App.header.render()
      return App.songs.listenToOnce App.songs.folder, 'change', @finishSong

    App.shows = new App.Views.Shows { @year } unless App.shows and App.shows.shows and App.shows.shows.year is +@year

    @finishSong()

  finishSong: =>
    self = @
    App.queue.on 'reset', ->
      ms = timeToMS self.time
      App.song = App.queue.findWhere { slug: self.slug }
      document.title = "#{App.song.get('title')} | #{self.year}/#{self.month}/#{self.day} | Relisten"
      App.queue.play App.song, ms
      App.queue.off 'reset'

    App.songs.songs.tracks.map (track) => _.extend track, { @band, @year, @month, @day, @showVersion }

    App.queue.reset App.songs.songs.tracks
  about: ->
    @changeView(new App.Views.AboutPage())
    document.title = 'About | Relisten'
  login: ->
    @changeView(new App.Views.LoginPage())
    document.title = 'Login | Relisten'
  register: ->
    @changeView(new App.Views.RegisterPage())
    document.title = 'Register | Relisten'
  playlist: (id) ->
    @changeView(new App.Views.PlaylistPage(playlistId: id))
    document.title = 'Playlist | Relisten'
  playlists: ->
    @changeView(new App.Views.PlaylistsPage(), false)
    document.title = 'Playlists | Relisten'
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
