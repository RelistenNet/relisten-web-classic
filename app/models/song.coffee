class App.Models.Song extends App.Models.Model
  url: ->
    id = @get '_id'
    return "/api/v1/song/#{id}" if id
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    showVersion = @get('showVersion') || 0
    slug = @get 'slug'
    version = @get('version') || 0
    ms = @get 'ms'
    "/api/v1/#{year}/#{month}/#{day}-#{showVersion}/#{slug}/#{version}"
  change: =>
    App.queue.push @
