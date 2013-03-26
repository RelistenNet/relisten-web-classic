class App.Views.Years extends App.Views.View
  autoRender: true
  el: '.years-container'
  template: JST['years']
  events:
    'click a': 'activate'
  render: ->
    App.router.clearActive()
    @$el.html @template
      years: years

    @$a = @$el.find 'a'

    @
  activate: (e) ->
    @$a.removeClass 'active'
    $(e.target).addClass 'active'
