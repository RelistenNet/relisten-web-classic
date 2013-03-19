class App.Collections.Folder extends App.Collections.Collection
  url: ->
    '/api/v1/folder/' + @get 'id'
