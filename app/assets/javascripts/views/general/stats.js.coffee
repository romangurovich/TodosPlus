class Todos.Views.Stats extends Backbone.View
  template: JST['general/stats']

  initialize: ->
    @listenTo(@collection, 'all', @render)

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