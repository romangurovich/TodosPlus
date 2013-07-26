class Todos.Views.Stats extends Backbone.View
  template: JST['general/stats']
  events:
    'click #clear-completed': 'clearCompleted'

  initialize: ->
    @listenTo(@collection, 'all', @render)
    @listenTo(@collection, 'change:completed', @filterOne);
    @listenTo(@collection,'filter', @filterAll);

  render: ->
    completed = @collection.completed().length;
    remaining = @collection.remaining().length;

    if @collection.length
      @$el.html(@template({completed: completed, remaining: remaining}))
      @$('#filters li a')
        .removeClass('selected')
        .filter('[href="#/' + ( Todos.Store.TodoFilter || '' ) + '"]')
        .addClass('selected');
    else 
      @$el.hide()

    @

  filterOne : (task) =>
    task.trigger('visible')

  filterAll : ->
    @collection.each(@filterOne, @)

  clearCompleted: ->
    _.invoke(@collection.completed(), 'destroy')
    false

