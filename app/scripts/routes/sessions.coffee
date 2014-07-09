'use strict';

class DadaSession.Routers.Sessions extends Backbone.Router
  
  initialize: () ->
    $('.sessions-menu li a')[0].click()

  routes: {
    'ban' : 'ban'
    'lyk' : 'lyk'
    'gaa' : 'gaa'
    'tuwyr': 'tuwyr'
  }

  ban: () ->
    @loadView(new DadaSession.Views.Ban(model: new DadaSession.Models.Ban()))
    
  lyk: () ->
    @loadView(new DadaSession.Views.Lyk(model: new DadaSession.Models.Lyk({start: 1, stop: 504})))
    
  gaa: () ->
    @loadView(new DadaSession.Views.Gaa(model: new DadaSession.Models.Gaa()))

  tuwyr: () ->
    @loadView(new DadaSession.Views.Tuwyr(model: new DadaSession.Models.Tuwyr()))
  
  loadView : (nextView) ->
    @view && @view.remove()
    @menuItem && @menuItem.parent().removeClass('active')
    @view = nextView
    @menuItem = $('.menu-' + Backbone.history.fragment)
    @menuItem.parent().addClass('active')
    $('.sandbox-header').html(@menuItem.text())
    $('.sandbox').html(nextView.el)
    nextView.render()
