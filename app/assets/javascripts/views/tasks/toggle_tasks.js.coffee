class Todos.Views.ToggleTasks extends Backbone.View
  template: JST['tasks/toggle']

  events:
    'click #toggle-all': 'toggleAllComplete'

  render: ->
    @$el.html(@template())
    @

  toggleAllComplete: ->
    allCheckbox = @$('#toggle-all')
    completed = allCheckbox.is(':checked')
    @collection.each((todo) ->
      todo.save('completed': completed))