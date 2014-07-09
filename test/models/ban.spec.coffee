# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Ban Model', ->
  beforeEach ->
    @BanModel = new DadaSession.Models.Ban();
