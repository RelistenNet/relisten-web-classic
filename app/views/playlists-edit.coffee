class App.Views.PlaylistsEdit extends App.Views.View
  className: 'playlists-edit-page'
  template: JST['playlists-edit']
  events:
    'submit form': 'saveBlurbs'
  initialize: ->
    App.playlist = new App.Models.Playlist _id: @options.playlistId
    #App.songsFolder.fetch() if App.songsFolder
    App.playlist.fetch()
    @listenToOnce App.playlist, 'change', @render
    App.header.render false
  render: ->
    @$el.html @template
      playlist: App.playlist.toJSON()

    @
  saveBlurbs: (e) ->
    e.preventDefault()

    playlistId = App.playlist.get '_id'
    title = @$el.find('input.name').val()
    data = { playlistId, title , arr: [] }

    PUT = @PUT

    $textarea = $('textarea')
    $textarea.each (idx) ->
      $text = $(@)
      val = if typeof $text.val() is 'string' then $text.val() else ''

      data.arr.push text: val, songId: $text.siblings('input').val()

      # Loop is finished, @PUT
      PUT data if idx is $textarea.length - 1

    false

  PUT: (data) ->
    $.ajax
      type: 'PUT'
      url: '/api/v1/blurbs'
      data: data
      success: (json) ->
        App.notify.send 'Saved', 'Your playlist has been saved' if json