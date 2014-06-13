# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Sessions Router', ->
  beforeEach ->
    @SessionsRouter = new DadaSession.Routers.Sessions();

  it 'index route', ->

