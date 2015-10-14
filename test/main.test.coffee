expect = require('chai').expect

process.env.NODE_ENV = 'test'

sentimentAnalysis = require('../index').main


describe 'Check the modules basic functionality', ()->

  it 'should return an integer', () ->
    expect(sentimentAnalysis('lorem ipsum dolor seit amet'))
    .to.be.a('number')
    expect(sentimentAnalysis('foo bar')).to.not.be.undefined;

  it 'Should return the correct sentiment value for negative sentences', () ->
    expect(sentimentAnalysis('I hate everything, everything is stupid')).equal(-0.5)
    expect(sentimentAnalysis('London is gloomy today because of all the smog')).equal(-0.4)
    expect(sentimentAnalysis('He was captured and put into slavery')).equal(-0.3)
    expect(sentimentAnalysis('Windows is very unstable')).equal(-0.2)
    expect(sentimentAnalysis('The slug was tired, he felt slugish')).equal(-0.2)

  it 'Should return the correct sentiment value for positive sentences', () ->
    expect(sentimentAnalysis('Today is a wonderful amazing awesome day')).equal(1)
    expect(sentimentAnalysis('I am so grateful for all the presents, thank you!')).equal(0.5)

  it 'Should not return a score greater than 1 of smaller than -1', () ->
    expect(sentimentAnalysis('happy happy amazing awesome cool'))
    .to.be.above(-1.1).to.be.below(1.1)
    expect(sentimentAnalysis('crap crap crap crap'))
    .to.be.above(-1.1).to.be.below(1.1)


  it 'Should be able to cope with weird inputs and never crash', ()->





