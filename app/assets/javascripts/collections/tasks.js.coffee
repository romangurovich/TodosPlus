class Todos.Collections.Tasks extends Backbone.Collection

  model: Todos.Models.Task

  url: '/api/tasks'

  comparator: (task) ->
    -task.get('updated_at')

  completed: ->
    this.where(completed: true)

  remaining: ->
    this.without.apply(this, this.completed())