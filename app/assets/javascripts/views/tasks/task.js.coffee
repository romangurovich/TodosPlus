class Todos.Views.Task extends Backbone.View
  tagName: 'li'
  template: JST['tasks/task']
  
  events:
    'dblclick label': 'edit'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'
    'click .toggle': 'toggleCompleted'
    'click .destroy': 'clear'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)
    @listenTo(@model, 'visible', @toggleVisible)

  render: ->
    @$el.html(@template(@model.attributes))

    @$el.toggleClass('completed', @model.get('completed'))
    @toggleVisible()

    @$input = @$('.edit')
    @

  edit: ->
    @$el.addClass('editing')
    @$input.focus()

  close: ->
    value = @$input.val().trim()
    if value
      @model.save({title: value})
    else
      @clear
    @$el.removeClass('editing')

  updateOnEnter: (e) ->
    @close() if e.which == 13

  toggleCompleted: ->
    @model.toggle()

  toggleVisible: ->
    @$el.toggleClass('hidden', @isHidden())

  isHidden: ->
    isCompleted = @model.get('completed')
    (not isCompleted and Todos.Store.TodoFilter is 'completed') or
        (isCompleted and Todos.Store.TodoFilter is 'active')

  clear: ->
    @model.destroy()