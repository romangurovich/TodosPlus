class Todos.Models.Task extends Backbone.Model
  defaults:
    title: ""
    completed: false

  urlRoot: '/api/tasks'

  toggle: ->   
    @save(completed: not @get('completed'))

  # parse: (response) ->
  #   console.log response
  #   c = new Date(Date.parse(response.created_at))
  #   u = new Date(Date.parse(response.updated_at))
  #   response.created_at = c
  #   response.updated_at = u
  #   console.log response
  #   response

  # toJSON: ->
  #   attrs = _.clone(@attributes);
  #   delete attrs.created_at
  #   delete attrs.updated_at
  #   attrs
