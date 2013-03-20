class App.Models.Song extends App.Models.Model
  url: ->
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    showVersion = @get('showVersion') || 0
    slug = @get 'slug'
    version = @get('version') || 0
    "/api/v1/#{year}/#{month}/#{day}-#{showVersion}/#{slug}/#{version}"
  change: ->
    App.player.play @get 'id'