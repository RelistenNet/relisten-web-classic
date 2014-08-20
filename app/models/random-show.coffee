class App.Models.RandomShow extends App.Models.Model
  url: ->
    #playlistId = @get 'playlistId'
    #return "/api/v1/playlist/#{playlistId}" if playlistId
    band = @get 'band'

    "#{App.root}/api/artists/#{band}/random_date"
  parse: (response) ->
    return {} unless response?.data

    date = response.data

    [year, month, day] = date.split '-'

    year = +year
    month = +month
    day = +day

    { year, month, day }