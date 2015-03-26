class App.Models.Plays extends App.Models.Model
  longPolling: false
  lastPoll: 0
  intervalSeconds: 7
  first: true
  responses: 0

  url: ->
    "#{App.root}/api/poll?since=#{@lastPoll}"

  parse: (response) ->
    @lastPoll = response.now

    return response

  startLongPolling: =>
    @longPolling = true
    @executeLongPolling()

  stopLongPolling: =>
    @longPolling = false

  executeLongPolling: =>
    @fetch success: @onFetch

  onFetch: =>
    @responses++
    setTimeout @executeLongPolling, 1000 * @intervalSeconds if @longPolling
