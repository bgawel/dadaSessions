# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Sessions Collection', ->
  beforeEach ->
    @SessionsCollection = new DadaSession.Collections.Sessions()
