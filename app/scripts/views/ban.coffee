'use strict';

class DadaSession.Views.Ban extends Backbone.View

  template: JST['app/scripts/templates/ban.ejs']

  tagName: 'div'

  id: ''

  className: 'sandbox-ban'

  events: {
    'submit form': 'buyNumber'
  }

  buyNumber: () ->
    $('.alert').html('You have just bought ' + $('input').val() + '. Feel free to buy another number.')
    $('.alert').show()

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
    $('input').change(() -> $('.alert').hide())
    $('.alert').hide()
