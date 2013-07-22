class Todos.Views.NewTask extends Backbone.View
  template: JST['tasks/new']
  events:
    'keypress input#new-todo': 'createOnEnter'

  render: ->
    @$el.html(@template())
    @

  createOnEnter: (e) ->
    $input = $('input#new-todo')
    if e.which is 13 and $input.val().trim()
      @collection.create({ title: $input.val().trim(), completed: false })
      $input.val('')