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
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9])?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'song'

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
  show: (year, month, day, showVersion) ->
    console.log 'hi'
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year } unless App.shows?.shows.get('year') is +year
    App.songs = new App.Views.Songs { year, month, day, showVersion }
  song: (year, month, day, showVersion, slug, version, time) ->
    console.log 'hi'
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year } unless App.shows?.shows.get('year') is +year
    folder = _.pick(App.songs.folder.toJSON(), 'year', 'month', 'day', 'showVersion') if App.songs
    console.log folder, { year, month, day, showVersion }
    App.songs = new App.Views.Songs { year, month, day, showVersion } unless _.isEqual folder, { year, month, day, showVersion }
    ms = timeToMS time
    return App.queue.play song, ms if song = App.queue.findWhere { year, month, day, slug, showVersion, version }
    App.song = new App.Models.Song { year, month, day, slug, showVersion, version, ms }
    App.song.fetch success: App.song.change
  login: ->
    @changeView(new App.Views.LoginPage())
  register: ->
    @changeView(new App.Views.RegisterPage())
  playlist: (id) ->
    @changeView(new App.Views.PlaylistPage(playlistId: id))
  playlists: ->
    @changeView(new App.Views.PlaylistsPage(), false)
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
