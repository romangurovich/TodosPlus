class Todos.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  el: $('#todo-list')
  
  intialize: ->
    @listenTo(@collection, 'reset', @addAll)
    @listenTo(@collection, 'add', @addOne)

  addOne: (task) =>
    newTaskView = new Todos.Views.Task(model: task)
    @$el.prepend(newTaskView.render().el)

  addAll: ->
    @$el.empty()
    @collection.each(@addOne, @)
