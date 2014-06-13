# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Tuwyr Model', ->
  beforeEach ->
    @TuwyrModel = new DadaSession.Models.Tuwyr();
