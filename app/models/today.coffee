class App.Models.Today extends App.Models.Model
  url: ->
    "#{App.root}/api/today"
  initialize: ->
    @fetch()
