class App.Models.Years extends App.Models.Model
  url: ->
    band = @get 'band'
    "http://relisten.net:49170/api/artists/#{band}/years"
