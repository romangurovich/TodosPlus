class Todos.Collections.Tasks extends Backbone.Collection

  model: Todos.Models.Task

  url: '/api/tasks'

  comparator: (task) ->
    task.get('updated_at')

  completed: ->
    @where(completed: true)

  remaining: ->
    @without.apply(@, @completed())