expect = require('chai').expect

process.env.NODE_ENV = 'test'

sentimentAnalysis = require('../index')._private


describe 'The doesWordExist method will return boolean weather word exists', ()->
  doesWordExist = sentimentAnalysis.doesWordExist

  it 'should return a boolean value', ()->
    expect(doesWordExist('coffee')).to.be.a('boolean')
    expect(doesWordExist('mocha')).to.be.a('boolean')
    expect(doesWordExist('java')).to.be.a('boolean')

  it 'should return true for words that exist', () ->
    expect(doesWordExist('woo')).to.be.true
    expect(doesWordExist('alive')).to.be.true
    expect(doesWordExist('awesome')).to.be.true
    expect(doesWordExist('anger')).to.be.true
    expect(doesWordExist('bright')).to.be.true
    expect(doesWordExist('love')).to.be.true
    expect(doesWordExist('easy')).to.be.true
    expect(doesWordExist('drunk')).to.be.true
    expect(doesWordExist('dumb')).to.be.true
    expect(doesWordExist('hacked')).to.be.true
    expect(doesWordExist('important')).to.be.true
    expect(doesWordExist('hug')).to.be.true
    expect(doesWordExist('itchy')).to.be.true
    expect(doesWordExist('laugh')).to.be.true
    expect(doesWordExist('stupid')).to.be.true
    expect(doesWordExist('bomb')).to.be.true

  it 'should return false for words that do not exist', () ->
    expect(doesWordExist('hello')).to.be.false
    expect(doesWordExist('world')).to.be.false
    expect(doesWordExist('everything')).to.be.false
    expect(doesWordExist('is')).to.be.false
    expect(doesWordExist('stupidness')).to.be.false
    expect(doesWordExist('acid')).to.be.false
    expect(doesWordExist('dinosaurs')).to.be.false
    expect(doesWordExist('laptop')).to.be.false
    expect(doesWordExist('pepsi')).to.be.false
    expect(doesWordExist('lorem')).to.be.false
    expect(doesWordExist('ipsum')).to.be.false
    expect(doesWordExist('squashed')).to.be.false
    expect(doesWordExist('watson')).to.be.false
    expect(doesWordExist('brain')).to.be.false

  it 'should not throw an error with funny values', ()->
    expect(doesWordExist(1)).to.be.a('boolean')
    expect(doesWordExist([])).to.be.a('boolean')
    expect(doesWordExist(true)).to.be.a('boolean')
    expect(doesWordExist(undefined)).to.be.a('boolean')
    expect(doesWordExist(1)).to.be.false
    expect(doesWordExist([])).to.be.false
    expect(doesWordExist(true)).to.be.false
    expect(doesWordExist(undefined)).to.be.false
