'use strict';

class DadaSession.Views.Lyk extends Backbone.View

  template: JST['app/scripts/templates/lyk.ejs']

  tagName: 'div'

  id: ''

  className: 'sandbox-lyk'

  events: {
    'click a.infinite-link': 'link',
  }

  link: (e) ->
    @model.set({start: @model.get('stop')+1, stop: @model.get('stop')+504})

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
