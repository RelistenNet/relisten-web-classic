class App.Models.Years extends App.Models.Model
  url: ->
    band = @get 'band'
    "#{App.root}/api/artists/#{band}/years"
