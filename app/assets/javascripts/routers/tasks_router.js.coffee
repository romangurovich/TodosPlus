class Todos.Routers.Tasks extends Backbone.Router
  routes:
    '*filter': 'setFilter'

  initialize: ->
    @$header = $('#header')
    @$main = $('#main')
    @$footer = $('#footer')

    @tasks = new Todos.Collections.Tasks(gon.tasks)

    @tasksView = new Todos.Views.TasksIndex(collection: @tasks)
    @statsView = new Todos.Views.Stats(collection: @tasks)
    @newTaskView = new Todos.Views.NewTask(collection: @tasks)
    @toggleTasksView = new Todos.Views.ToggleTasks(collection: @tasks)

    @index()


  index: ->
    @$header.append(@newTaskView.render().el)
    @$main.append(@toggleTasksView.render().el)
    @$main.append(@tasksView.render().el)
    @$footer.html(@statsView.render().el)

  setFilter: (param) ->
    param = param.trim() if param
    Todos.Store.TodoFilter = param || ''
    @tasks.trigger('filter')