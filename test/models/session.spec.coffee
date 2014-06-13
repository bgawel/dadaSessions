# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Session Model', ->
  beforeEach ->
    @SessionModel = new DadaSession.Models.Session();
