class App.Models.Shows extends App.Models.Model
  url: ->
    year = @get 'year'
    band = @get 'band'
    "#{App.root}/api/artists/#{band}/years/#{year}"

  parse: (response) ->
    response.data.shows.map (show) ->
      [year, month, day] = show.display_date.split '-'

      show.year = +year
      show.month = +month
      show.day = +day

      show.day = +day.split(' ')[0] if !show.day

      show

    response.data
