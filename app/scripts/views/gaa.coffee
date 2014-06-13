'use strict';

class DadaSession.Views.Gaa extends Backbone.View

  template: JST['app/scripts/templates/gaa.ejs']

  tagName: 'div'

  id: ''

  className: 'sandbox-gaa'

  events: {
    'submit form': 'submitQuestion'
  }

  submitQuestion: () ->
    if @searchTerm == $('#search').val()
      return
    @searchTerm = $('#search').val()
    $('.alert').html('Please wait...')
    $('.alert').show()
    answerIndex = Math.floor(Math.random() * @answers.length)
    WikiquoteApi.getRandomQuote(
      @answers[answerIndex]
      (newQuote) ->
        $('.alert').html('Your answer: <b>' + newQuote.quote + '</b>')
      (msg) -> alert(msg)
    )

  initialize: () ->
    @listenTo @model, 'change', @render
    @answers = new Array()
    @answers[0] = 'Martin Heidegger'
    @answers[1] = 'Jean-François Lyotard'
    @answers[2] = 'Roland Barthes'
    @answers[3] = 'Jacques Derrida'
    @answers[4] = 'Alain Badiou'
    @answers[5] = 'Slavoj Žižek'
    @answers[6] = 'Michel Foucault'
    @answers[7] = 'Jean Baudrillard'
    @answers[8] = 'Pierre Bourdieu'
    @answers[9] = 'Gilles Deleuze'

  render: () ->
    @$el.html @template(@model.toJSON())
    $('#search').change(() -> $('.alert').hide())
    $('.alert').hide()
