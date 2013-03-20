class App.Router extends Backbone.Router
  routes:
    '': 'index'
    'login': 'login'
    'register': 'register'
    # Last route should catch all
    #':notFound': 'notFound'
  initialize: ->
    @route /^([0-9]{4})\/?$/, 'year'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/?$/, 'show'
    @route /^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{1,2})\/?$/, 'song'

    @$container = $('#page-container')
    @bind 'all', @_trackPageview
  index: ->
    @changeView(new App.Views.HomePage())
    App[n].close() for n in ['shows', 'songs'] if App[n]
    App.years = new App.Views.Years()
    App.shows = new App.Views.Shows()
    App.songs = new App.Views.Songs()
  year: (year) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
    App.shows = new App.Views.Shows { year }
    App.songs.$el.empty()
  show: (year, month, day, version) ->
    if App.initial
      @changeView(new App.Views.HomePage())
      App.years = new App.Views.Years()
      App.shows = new App.Views.Shows { year }
    App.songs = new App.Views.Songs { year, month, day, version }
  login: ->
    @changeView(new App.Views.LoginPage())
  song: (id) ->
    App.player.play id
  register: ->
    @changeView(new App.Views.RegisterPage())
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
    App.initial = false
    url = Backbone.history.getFragment()
    _gaq.push(['_trackPageview', "/#{url}"])
