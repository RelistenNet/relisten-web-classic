class Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Tweezer'

  initialize: ->
    App.user = new App.Models.User(user)
    App.csrf = csrf if window.csrf
    App.initial = true
    @initViews()

    # Register all routes and start routing
    App.router = new App.Router()

    Backbone.history.start({ pushState: true })

    @pushAnchors()

  # Instantiate common views
  initViews: ->
    App.notify = new App.Views.Notifications()
    App.header = new App.Views.Header()
    App.queueView = new App.Views.Queue()
    App.footer = new App.Views.Footer()
    App.player = new App.Models.Player()
    App.playerView = new App.Views.Player()

    #App.notify.send 'Archive is down', 'Archive.org is down for routine maintenance, therefore no audio will stream properly. Please follow @phishvids on twitter for updates. Sorry for the inconvenience.', 'sticky', true

  pushAnchors: ->
    # Thanks Gib + Art.sy
    # Globally capture clicks. If they are internal and not in the pass
    # through list, route them through Backbone's navigate method.
    $(document).on "click", "a[href^='/']", (event) ->

      $el = $(event.currentTarget)
      href = $el.attr('href')
      bypass = $el.attr('data-bypass')

      # chain 'or's for other black list routes
      passThrough = /logout|auth/.test href

      # Allow shift+click for new tabs, etc.
      if !bypass && !passThrough && !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
        event.preventDefault()

        # Remove leading slashes and hash bangs (backward compatablility)
        url = href.replace(/^\//,'').replace('\#\!\/','')

        # Instruct Backbone to trigger routing events
        App.router.navigate url, { trigger: true }

        return false
