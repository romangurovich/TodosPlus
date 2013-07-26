class Todos.Models.Task extends Backbone.Model
  defaults:
    title: ""
    completed: false

  urlRoot: '/api/tasks'

  toggle: ->   
    @save(completed: not @get('completed'))