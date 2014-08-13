class App.Models.Songs extends App.Models.Model
  url: ->
    #playlistId = @get 'playlistId'
    #return "/api/v1/playlist/#{playlistId}" if playlistId
    band = @get 'band'
    year = @get 'year'
    month = addZero @get 'month'
    day = addZero @get 'day'

    "http://localhost:9000/api/artists/#{band}/years/#{year}/shows/#{year}-#{month}-#{day}"

  parse: (response) ->
    response