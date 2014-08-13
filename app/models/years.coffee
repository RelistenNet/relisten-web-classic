class App.Models.Years extends App.Models.Model
  url: ->
    band = @get 'band'
    "http://localhost:9000/api/artists/#{band}/years"
