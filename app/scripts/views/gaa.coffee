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
    $('.alert').html('Please wait...')
    $('.alert').show()
    newTerm = $('#search').val().trim()
    newTerm = if newTerm.charAt(newTerm.length-1) == '?' then newTerm.substr(0, newTerm.length-1) else newTerm
    terms = newTerm.split(' ')
    longestTerm = _.max(terms, (term) -> term.length)
    WikiquoteApi.getRandomQuote(
      longestTerm
      (newQuote) =>
        if (newQuote.quote.trim().length == 0)
          @searchByAuthor()
        else
          $('.alert').html('Your answer: <b>' + newQuote.quote + '</b>')
      (msg) => @searchByAuthor()
    )
    
  searchByAuthor: () ->
    WikiquoteApi.getRandomQuote(
      @authors[Math.floor(Math.random() * @authors.length)]
      (newQuote) ->
        $('.alert').html('Your answer: <b>' + newQuote.quote + '</b>')
      (msg) -> alert(msg)
    )

  initialize: () ->
    @listenTo @model, 'change', @render
    @authors = new Array()
    @authors[0] = 'Martin Heidegger'
    @authors[1] = 'Jean-François Lyotard'
    @authors[2] = 'Roland Barthes'
    @authors[3] = 'Jacques Derrida'
    @authors[4] = 'Alain Badiou'
    @authors[5] = 'Slavoj Žižek'
    @authors[6] = 'Michel Foucault'
    @authors[7] = 'Jean Baudrillard'
    @authors[8] = 'Pierre Bourdieu'
    @authors[9] = 'Gilles Deleuze'

  render: () ->
    @$el.html @template(@model.toJSON())
    $('#search').change(() -> $('.alert').hide())
    $('.alert').hide()
