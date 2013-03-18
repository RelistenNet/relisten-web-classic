class App.Models.Folder extends App.Models.Model
  url: ->
    '/api/v1/folder/' + @get 'id'
