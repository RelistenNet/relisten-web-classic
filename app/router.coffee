class App.Router extends Backbone.Router
  routes:
    '': 'index'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
   #@route /^playlist\/([0-9a-f]{24})\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'playlistSong'

    @route /^([a-z]+(?:-[a-z]+)*)\/?$/, 'band'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/?$/, 'year'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, 'day'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/?$/, 'show'
    @route /^([a-z]+(?:-[a-z]+)*)\/([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9]{1,2})?\/([a-zA-Z0-9\-]*)\/?([0-9]{1,2})?\:?\:?([0-9]{1,2}m[0-9]{1,2})?s?\/?$/, 'song'
    @route /^about\/?$/, 'about'
    @route /^gapless\/?$/, 'gapless'
    @route /^oops\/?$/, 'oops'
    @route /^real-music\/?$/, 'realMusic'

    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @band = ''
    @changeView(new App.Views.IndexPage())
    document.title = 'Relisten'
  realMusic: ->
    @band = ''
    @changeView(new App.Views.IndexPage(realMusic: true))
    document.title = 'Real Music | Relisten'
  band: (@band, @year, @month, @day) ->
    App.router.updateDescription "Relisten to #{App.bands[@band].shows} #{App.bands[@band].name} recordings"
    @changeView(new App.Views.HomePage())
    @randomShow = new App.Models.RandomShow { @band }
    @randomShow.fetch success: =>
      { @year, @month, @day } = @randomShow.toJSON()

      App.years = new App.Views.Years { @band }
      App.shows = new App.Views.Shows { @band, @year }
      App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
    App.header.render()
    document.title = "Relisten to #{"the " if App.bands[@band].the}#{App.bands[@band].name}"
  year: (@band, @year, @month, @day) ->
    App.router.updateDescription """
      Relisten to #{App.bands[@band].name} concerts from #{@year}
    """
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { band, year }
    App.songs.$el.empty() if App.songs
    App.header.render()
    document.title = "#{year} | #{App.bands[@band].name} | Relisten"
  day: (@band, @year, @month, @day) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day }
    App.header.render()
    document.title = "#{@year}/#{@month}/#{@day} | #{App.bands[@band].name} | Relisten"
  show: (@band, @year, @month, @day, @showVersion) ->
    App.songs.undelegateEvents() if App.songs
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years { @band }
    App.shows = new App.Views.Shows { @band, @year } unless App.shows and App.shows.shows and App.shows.shows.get('year') is +@year
    App.songs = new App.Views.Songs { @band, @year, @month, @day, @showVersion }
    App.header.render()
    document.title = "#{@year}/#{@month}/#{@day} | #{App.bands[@band].name} | Relisten"
  song: (@band, @year, @month, @day, @showVersion, @slug, @version, @time) ->
    if @version
      @slug += '-' + @version
    if App.initial
      @time = @getParameterByName 't' unless /m/.test @time
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

      tracks = @pluck("file")

      if cookie("gapless") && gapless5AudioContext
        if @gaplessPlayer
          @gaplessPlayer.stop()
          @gaplessPlayer.removeAllTracks()
          for track in tracks
            @gaplessPlayer.addTrack track
        else
          @gaplessPlayer = new Gapless5 "gapless-block",
            tracks: tracks
            playOnLoad: true

          @gaplessPlayer.onnext = ->
            App.queue.play null, 0

        $("footer .buttons > div, footer .progress-container, .player .time, .player .volume-container").hide()
        $("#gapless-block").show()
        $("footer .buttons").css margin: "0 auto auto auto",  width: "225px"
        $("footer").css borderTop: "2px solid #888"

      ms = timeToMS self.time
      App.song = App.queue.findWhere { slug: self.slug }
      document.title = "#{App.song.get('title')} | #{self.year}/#{self.month}/#{self.day} | #{App.bands[self.band].name} | Relisten"
      App.queue.play App.song, ms
      App.queue.off 'reset'

    App.queue.reset App.songs.songs.tracks
  about: ->
    @changeView(new App.Views.AboutPage())
    document.title = 'About | Relisten'
  gapless: ->
    @changeView(new App.Views.GaplessPage())
    document.title = 'Gapless | Relisten'
  oops: ->
    @changeView(new App.Views.OopsPage())
    document.title = 'Oops | Relisten'
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

  getParameterByName: (name) ->
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
    regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
    results = regex.exec(location.search)
    (if not results? then "" else decodeURIComponent(results[1].replace(/\+/g, " ")))
  updateDescription: (desc) ->
    @$meta = $('meta[name=description]') unless @$meta

    @$meta.attr 'content', desc
