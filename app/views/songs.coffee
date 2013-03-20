class App.Views.Songs extends App.Views.View
  el: '.songs-container'
  template: JST['songs']
  events:
    'click .add': 'addToPlaylist'
  initialize: ->
    return @render() unless @options.year || @options.month || @options.day
    @folder = new App.Models.Songs
      year: @options.year
      month: @options.month
      day: @options.day
      version: @options.showVersion || 0

    @listenTo @folder, 'change', @render
    @folder.fetch()
  render: ->
    App.router.clearActive()
    @$el.html @template
      songs: if @folder then @folder.toJSON() else songs

    @

  addToPlaylist: (e) ->
    $add = $(e.target)
    id = $add.attr 'data-id'
    songs = App.playlist.get '_songs'
    songs.push id
    App.playlist.set '_songs', songs
    App.playlist.save()
    App.notify.send 'Song Added', $add.attr 'data-song'
