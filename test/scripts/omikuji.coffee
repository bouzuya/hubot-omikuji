require '../helper'

describe 'omikuji', ->
  beforeEach (done) ->
    @default = ["凶", "吉", "大吉"]
    @kakashi.scripts = [require '../../src/scripts/omikuji']
    @kakashi.users = [{ id: 'bouzuya', room: 'hitoridokusho' }]
    @kakashi.start().then done, done

  afterEach (done) ->
    @kakashi.stop().then done, done

  describe 'receive "@hubot omikuji"', ->
    it 'send "<default item>"', (done) ->
      sender = id: 'bouzuya', room: 'hitoridokusho'
      message = '@hubot omikuji'
      @kakashi
        .receive sender, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@default).to.include(@kakashi.send.firstCall.args[1])
        .then (-> done()), done

  describe 'receive "@hubot omikuji default"', ->
    it 'send "<default item>"', (done) ->
      sender = id: 'bouzuya', room: 'hitoridokusho'
      message = '@hubot omikuji default'
      @kakashi
        .receive sender, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@default).to.include(@kakashi.send.firstCall.args[1])
        .then (-> done()), done

  describe 'receive "@hubot omikuji reviewer"', ->
    beforeEach ->
      @originalInitialData = process.env.HUBOT_OMIKUJI_INITIAL_DATA
      @reviewer = ["bouzuya", "emanon001"]
      process.env.HUBOT_OMIKUJI_INITIAL_DATA =
        JSON.stringify reviewer: @reviewer

    afterEach ->
      process.env.HUBOT_OMIKUJI_INITIAL_DATA = @originalInitialData

    it 'send "<reviewer item>"', (done) ->
      sender = id: 'bouzuya', room: 'hitoridokusho'
      message = '@hubot omikuji reviewer'
      @kakashi
        .receive sender, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@reviewer).to.include(@kakashi.send.firstCall.args[1])
        .then (-> done()), done
