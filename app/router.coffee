class App.Router extends Backbone.Router
  routes:
    '': 'index'
    'login': 'login'
    'register': 'register'
    'playlists': 'playlists'
    'playlist/:id': 'playlist'
    'playlist/:id/edit': 'editPlaylist'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
    @route /^([0-9]{4})\/?$/, 'year'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/?$/, 'show'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'song'
    @route /^playlist\/([0-9a-f]{24})\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'playlistSong'


    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @changeView(new App.Views.HomePage())
    App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year: 2012, month: 6, day: 7 }
    App.songs = new App.Views.Songs { year: 2012, month: 6, day: 7 }
  year: (year) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year }
    App.songs.$el.empty() if App.songs
  show: (@year, @month, @day, @showVersion) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year } unless App.shows?.shows.get('year') is +year
    App.songs = new App.Views.Songs { @year, @month, @day, @showVersion }
  song: (@year, @month, @day, @showVersion, @slug, @version, @time) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
      App.shows = new App.Views.Shows { year }
      App.songs = new App.Views.Songs { @year, @month, @day, @showVersion }
      return App.songs.listenToOnce App.songs.folder, 'change', @finishSong

    App.shows = new App.Views.Shows { year } unless App.shows?.shows.get('year') is +year
    @finishSong()

  finishSong: =>
    self = @
    App.queue.on 'reset', ->
      ms = timeToMS self.time
      App.song = App.queue.findWhere { slug: self.slug, version: +self.version || 0 }
      App.queue.play App.song, ms
      App.queue.off 'reset'
    App.queue.reset App.songs.folder.get('_songs')
  login: ->
    @changeView(new App.Views.LoginPage())
  register: ->
    @changeView(new App.Views.RegisterPage())
  playlist: (id) ->
    @changeView(new App.Views.PlaylistPage(playlistId: id))
  playlists: ->
    @changeView(new App.Views.PlaylistsPage(), false)
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
    ga('send', 'pageview', "/#{url}");
