class App.Views.IndexPage extends App.Views.View
  className: 'index-page'
  template: JST['index']
  render: =>
    App.header.render()
    @$el.html @template
      bands: App.bands
