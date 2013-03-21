class App.Router extends Backbone.Router
  routes:
    '': 'index'
    'login': 'login'
    'register': 'register'
    'playlists': 'playlists'
    'playlist/new': 'newPlaylist'
    'playlist/:id': 'playlist'
    'playlist/:id/edit': 'editPlaylist'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
    @route /^([0-9]{4})\/?$/, 'year'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/?$/, 'show'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9])?\/?$/, 'song'

    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @changeView(new App.Views.HomePage())
    App.years = new App.Views.Years()
    App.shows = new App.Views.Shows()
    App.songs = new App.Views.Songs()
  year: (year) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year }
    App.songs.$el.empty() if App.songs
  show: (year, month, day, showVersion) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
      App.shows = new App.Views.Shows { year }
    App.songs = new App.Views.Songs { year, month, day, showVersion }
  song: (year, month, day, showVersion, slug, version) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
      App.shows = new App.Views.Shows { year }
      App.songs = new App.Views.Songs { year, month, day, showVersion }
    App.song = new App.Models.Song { year, month, day, slug, showVersion, version }
    App.song.fetch
      success: ->
        App.song.change()
  login: ->
    @changeView(new App.Views.LoginPage())
  register: ->
    @changeView(new App.Views.RegisterPage())
  playlist: (id) ->
    @changeView(new App.Views.PlaylistPage(playlistId: id))
  playlists: ->
    @changeView(new App.Views.PlaylistsPage(), false)
  newPlaylist: ->
    @index()
    App.newPlaylist = new App.Views.NewPlaylist()
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

    @currentView = view
    @$container.html(view.el).fadeIn('fast')
  notFound: ->
    @navigate '/', trigger: true
  _trackPageview: ->
    App.initial = false if App.initial
    url = Backbone.history.getFragment()
    _gaq.push(['_trackPageview', "/#{url}"])
