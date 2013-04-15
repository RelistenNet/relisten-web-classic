class App.Models.Songs extends App.Models.Model
  url: ->
    #playlistId = @get 'playlistId'
    #return "/api/v1/playlist/#{playlistId}" if playlistId
    year = @get 'year'
    month = @get 'month'
    day = @get 'day'
    versionStr = if @get('version') then '-' + @get('version') else ''
    "/api/v1/#{year}/#{month}/#{day}#{versionStr}"
