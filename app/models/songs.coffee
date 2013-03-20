class App.Models.Songs extends App.Models.Model
  url: ->
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    version = @get('version') || 0
    "/api/v1/#{year}/#{month}/#{day}-#{version}"
