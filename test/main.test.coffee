expect = require('chai').expect

process.env.NODE_ENV = 'test'

sentimentAnalysis = require('../index').main


describe 'Check the modules basic functionality', ()->

  it 'should return an integer', () ->
    expect(sentimentAnalysis('lorem ipsum dolor seit amet'))
    .to.be.a('number')

    expect(sentimentAnalysis('foo bar')).to.not.be.undefined;






