window.Todos =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Store: {}
  initialize: ->
    new Todos.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  Todos.initialize()
