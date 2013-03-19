class App.Models.Shows extends App.Models.Model
  url: ->
    year = @get 'year'
    "/api/v1/#{year}"
