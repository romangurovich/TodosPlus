class Todos.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
  initialize: ->
    @$main = $('#main')
    @$footer = $('#footer')
    @$tasklist = $('#tasklist')
    @collection = new Todos.Collections.Tasks(gon.tasks)

  index: ->
    tasksView = new Todos.Collections.Tasks(collection: @collection)
    @$tasklist.html(tasksView.render().el)



