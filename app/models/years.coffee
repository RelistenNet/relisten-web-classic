class App.Models.Years extends App.Models.Model
  url: ->
    band = @get 'band'
    "http://marcoallday.com/api/artists/#{band}/years"
