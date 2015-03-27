class App.Views.TodayPage extends App.Views.View
  className: 'today-page'
  template: JST['today']
  events:
    'click a': 'clickA'
  initialize: ->
    @model = new App.Models.Today()
    @model.on 'change', @render
    App.router.clearActive($('header .today'))
  render: =>
    if @$el
      @$el.html @template(@model.toJSON())
  clickA: ->
    App.initial = true
