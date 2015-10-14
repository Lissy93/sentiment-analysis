expect = require('chai').expect

process.env.NODE_ENV = 'test'

sentimentAnalysis = require('../index')._private


describe 'doesWordExist will return boolean weather word exists', ()->
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
    expect(doesWordExist(undefined)).to.be.false



describe 'getScoreOfWord method return a sentiment score for that word', ()->
  getScoreOfWord = sentimentAnalysis.getScoreOfWord

  it 'should return an integer', ()->
    expect(getScoreOfWord('amazing')).to.be.a('number')
    expect(getScoreOfWord('warm')).to.be.a('number')
    expect(getScoreOfWord('yummy')).to.be.a('number')

  it 'should be in a range of -5 to + 5', () ->
    expect(getScoreOfWord('nice')).to.be.above(-5).to.be.below(5)
    expect(getScoreOfWord('good')).to.be.below(5).to.be.below(5)
    expect(getScoreOfWord('great')).to.be.above(-5).to.be.below(5)
    expect(getScoreOfWord('awesome')).to.be.above(-5).to.be.below(5)

  it 'should return 0 if word doesn\'t exist, rather than crashing', ()->
    expect(getScoreOfWord('batman')).equal(0)
    expect(getScoreOfWord('superman')).equal(0)
    expect(getScoreOfWord('spiderman')).equal(0)
    expect(getScoreOfWord('pepperpig')).equal(0)

  it 'should return 0 if passed multiple words at a time that don\'t exist', ()->
    expect(getScoreOfWord('type error')).equal(0)
    expect(getScoreOfWord('everything is stupid')).equal(0)
    expect(getScoreOfWord('dinosaurs are awesome')).equal(0)

  it 'should return actual positive score for positive words that exist', ()->
    expect(getScoreOfWord('united')).equal(1)
    expect(getScoreOfWord('unstoppable')).equal(2)
    expect(getScoreOfWord('excited')).equal(3)
    expect(getScoreOfWord('win')).equal(4)
    expect(getScoreOfWord('outstanding')).equal(5)

  it 'should return actual negative score for negative words that exist', ()->
    expect(getScoreOfWord('fight')).equal(-1)
    expect(getScoreOfWord('fails')).equal(-2)
    expect(getScoreOfWord('evil')).equal(-3)
    expect(getScoreOfWord('fraud')).equal(-4)
    expect(getScoreOfWord('twat')).equal(-5)

  it 'should return 0 for neutral words that exist', ()->
    expect(getScoreOfWord('some kind')).equal(0)
    # There is only 1 neutral result in the AFINN word list!

describe 'getWordsInSentence will transform a sentence into a clean array', ()->
  getWordsInSentence = sentimentAnalysis.getWordsInSentence

  it 'Should correctly turn a sentence into an array', ()->
    expect(getWordsInSentence('hello world')).eql(['hello', 'world'])
    expect(getWordsInSentence('this is a longer sentence'))
    .eql(['this', 'is', 'a', 'longer', 'sentence'])

  it 'Should normalise case', ()->
    expect(getWordsInSentence('HeLlO wOrLd')).eql(['hello', 'world'])
    expect(getWordsInSentence('JAVASCRIPT')).eql(['javascript'])

  it 'Should remove dupplicates', ()->
    expect(getWordsInSentence('foo foo bar foo'))
    .eql(['foo', 'bar'])
  expect(getWordsInSentence('foo foo BAR Foo bAr foO bar foo'))
  .eql(['foo', 'bar', ])

  it 'Should remove blanks', ()->
    expect(getWordsInSentence('space       blank        '))
    .eql(['space', 'blank'])

  it 'Should remove special characters', ()->
    expect(getWordsInSentence('foo ! ^&*^&^%^%&^^&%%^bar$$%^'))
    .eql(['foo', 'bar'])

describe 'removeDupplicates should remove dupplicates from an array', () ->
  removeDupplicates = sentimentAnalysis.removeDuplicates

  it 'should remove duplicates', () ->
    expect(removeDupplicates(['hello', 'world', 'hello', 'hello']))
    .eql(['hello', 'world'])

describe 'scaleScore should ensure the score is within the valid range', () ->
  scaleScore = sentimentAnalysis.scaleScore

  it 'should not be below -1', () ->
    expect(scaleScore(-1.2)).to.be.above(-1.01)
    expect(scaleScore(-38.8)).to.be.above(-1.01)
    expect(scaleScore(1.2)).to.be.above(-1.01)

  it 'should not be above +1', () ->
    expect(scaleScore(4.5)).to.be.below(1.01)
    expect(scaleScore(42)).to.be.below(1.01)
    expect(scaleScore(-1.2)).to.be.below(1.01)

  it 'should have 1 or 2 decimal places', () ->
    expect(scaleScore(1)).to.be.within(-1,+1);
    expect(scaleScore(-1)).to.be.within(-1,+1);
    expect(scaleScore(0)).to.be.within(-1,+1);
    expect(scaleScore(10)).to.be.within(-1,+1);
    expect(scaleScore(-1)).to.be.within(-1,+1);
    expect(scaleScore(-1.01)).to.be.within(-1,+1);
    expect(scaleScore(+1.0001)).to.be.within(-1,+1);
    expect(scaleScore(999999)).to.be.within(-1,+1);
    expect(scaleScore(-999999)).to.be.within(-1,+1);
    expect(scaleScore(-0)).to.be.within(-1,+1);
    expect(scaleScore(+0)).to.be.within(-1,+1);
    expect(scaleScore(42)).to.be.within(-1,+1);
    expect(scaleScore(3.1415926535897932)).to.be.within(-1,+1);
    expect(scaleScore(-273.15)).to.be.within(-1,+1);

