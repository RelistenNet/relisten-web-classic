listedPlays = {}

class App.Views.LivePage extends App.Views.View
  className: 'live-page'
  template: JST['live']
  events:
    'click a': 'clickA'
  initialize: ->
    @model = new App.Models.Plays()
    @model.startLongPolling @render
    @model.on 'change', @render
    App.router.clearActive($('header .live'))
    @fresh()
  render: =>
    if @$el
      total = 0
      plays = @model.get('plays') || []
      plays = plays.map (play) =>
        listedPlays[play.id] = true if @model.responses == 0 && ++total > 5
        listed = listedPlays[play.id] || false
        _.extend play, { bandName: App.bands[play.band].name, listed }
      @$el.html @template({ plays, listedPlays })
  fresh: =>
    $el = @$('.fresh:last')
    id = $el.attr('data-id')
    listedPlays[id] = true
    $el.slideDown =>
      $el.removeClass('fresh')

    if @model.longPolling
      setTimeout =>
        @fresh()
      , Math.floor(Math.random() * 2000) + 300

  remove: ->
    @model.stopLongPolling()
    super
  clickA: ->
    App.initial = true
