class App.Models.Song extends App.Models.Model
  url: ->
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    number = @get 'number'
    "/api/v1/#{year}/#{month}/#{day}/#{number}"
