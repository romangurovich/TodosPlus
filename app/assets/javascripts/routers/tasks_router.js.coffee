class Todos.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'
  initialize: ->
    @$main = $('#main')
    @$footer = $('#footer')

    @$newTask = $('#new-task')
    @$tasklist = $('#tasklist')

    @tasks = new Todos.Collections.Tasks(gon.tasks)

    @tasksView = new Todos.Views.TasksIndex(collection: @tasks)
    @statsView = new Todos.Views.Stats(collection: @tasks)
    @newTaskView = new Todos.Views.NewTask(collection: @tasks)


  index: ->
    @$newTask.html(@newTaskView.render().el)
    @$tasklist.html(@tasksView.render().el)
    @$footer.html(@statsView.render().el)




