window.DadaSession =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'
    new @Routers.Sessions()
    Backbone.history.start()

$ ->
  'use strict'
  DadaSession.init();
