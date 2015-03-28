class App.Views.ChatPage extends App.Views.View
  className: 'chat-page'
  template: JST['chat']
  initialize: ->
    App.router.clearActive($('header .chat'))
  render: ->
    @$el.html @template({})
    _.defer ->
      target_element = document.getElementById("tlkio")
      channel_name = target_element.getAttribute("data-channel")
      custom_css_path = target_element.getAttribute("data-theme")
      nickname = target_element.getAttribute("data-nickname")
      iframe = document.createElement("iframe")
      iframe_src = "//embed.tlk.io/" + channel_name
      iframe_query = []
      iframe_query.push "custom_css_path=" + custom_css_path  if custom_css_path and custom_css_path.length > 0
      iframe_query.push "nickname=" + nickname  if nickname and nickname.length > 0
      iframe_src += "?" + iframe_query.join("&")  if iframe_query.length > 0
      iframe.setAttribute "src", iframe_src
      iframe.setAttribute "width", "100%"
      iframe.setAttribute "height", "100%"
      iframe.setAttribute "frameborder", "0"
      iframe.setAttribute "style", "margin-bottom: -8px;"
      current_style = target_element.getAttribute("style")
      target_element.setAttribute "style", "overflow: auto; -webkit-overflow-scrolling: touch;" + current_style
      target_element.appendChild iframe
