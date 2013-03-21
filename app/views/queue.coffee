class App.Views.Queue extends App.Views.View
  el: '.queue-container'
  template: JST['queue']
  initialize: ->
    App.queue = new App.Collections.Queue()
    @listenTo App.queue, 'add', @render
    @listenTo App.queue, 'reset', @render
    @render()
  render: ->
    @$el.html @template
      queue: App.queue.toJSON()
