class Todos.Models.Task extends Backbone.Model
  defaults:
    title: ""
    completed: false

  toggle: ->   
    this.save(completed: not this.get('completed'))

  parse: (response) ->
    c = new Date(Date.parse(response.created_at))
    u = new Date(Date.parse(response.updated_at))
    response.created_at = c
    response.updated_at = u
    response