class Todos.Views.Task extends Backbone.View
  tagName: 'li'
  template: JST['tasks/task']
  events:
    'dblclick label': 'edit'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  intialize: ->
    this.listenTo(@model, 'change', this.render)

  render: ->
    this.$el.html(@template(@model.attributes))
    this.$input = this.$('edit')
    this

  edit: ->
    this.$el.addClass('editing')
    this.$input.focus()

  close: ->
    value = this.$input.val().trim()
    @model.save({title: value}) if value
    this.$el.removeClass('editing')

  updateOnEnter: (e) ->
    this.close() if e.which == ENTER_KEY