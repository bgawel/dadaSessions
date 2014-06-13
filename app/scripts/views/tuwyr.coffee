'use strict';

class DadaSession.Views.Tuwyr extends Backbone.View

  template: JST['app/scripts/templates/tuwyr.ejs']

  tagName: 'div'

  id: ''

  className: 'sandbox-tuwyr'

  events: {
    'submit form': 'sendData'
  }

  sendData: () ->
    alert = $('.alert')
    alert.toggleClass('alert-info').toggleClass('alert-success')
    alert.text('Thank you for providing your data. We will get back to you with some viral and nasty ads. ' +
        'Be proud of yourself, you just made the Internet a better place to surf!!')
    $('html, body').animate({ scrollTop: 0 }, 'slow')

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
    pulsate = () ->
      $('.pulsate').
        animate({opacity: 0.2}, 1000, 'linear').
        animate({opacity: 1}, 1000, 'linear', pulsate)
    pulsate()
