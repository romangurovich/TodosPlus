class Todos.Views.Task extends Backbone.View
  tagName: 'li'
  template: JST['tasks/task']
  events:
    'dblclick label': 'edit'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.attributes))
    @$input = @$('.edit')
    @

  edit: ->
    @$el.addClass('editing')
    @$input.focus()

  close: ->
    value = @$input.val().trim()
    console.log @model
    @model.save({title: value}) if value
    @$el.removeClass('editing')

  updateOnEnter: (e) ->
    @close() if e.which == 13