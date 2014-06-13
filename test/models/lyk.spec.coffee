# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Lyk Model', ->
  beforeEach ->
    @LykModel = new DadaSession.Models.Lyk();
