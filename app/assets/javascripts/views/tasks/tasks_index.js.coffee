class Todos.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  tagName: 'ul'

  id: 'todo-list'
  
  initialize: ->
    @listenTo(@collection, 'reset', @addAll)
    @listenTo(@collection, 'sort', @addAll)
    @listenTo(@collection, 'change', @addAll)
    @listenTo(@collection, 'add', @addOne)
    console.log "hello"

  addOne: (task) =>
    newTaskView = new Todos.Views.Task(model: task)
    @$el.prepend(newTaskView.render().el)

  addAll: ->
    @$el.empty()
    @collection.each(@addOne, @)

  render: ->
    @addAll()
    @
