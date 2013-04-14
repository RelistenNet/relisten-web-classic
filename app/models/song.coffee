class App.Models.Song extends App.Models.Model
  url: ->
    id = @get '_id'
    return "/api/v1/song/#{id}" if id
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    showVersion = @get('showVersion') || 0
    slug = @get 'longSlug'
    "/api/v1/#{year}/#{month}/#{day}-#{showVersion}/#{slug}"
  change: =>
    App.queue.push @
