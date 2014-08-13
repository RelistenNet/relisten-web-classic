class App.Models.Years extends App.Models.Model
  url: ->
    band = @get 'band'
    "http://data.relisten.net/api/artists/#{band}/years"
