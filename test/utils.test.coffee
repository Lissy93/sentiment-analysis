expect = require('chai').expect

process.env.NODE_ENV = 'test'

sentimentAnalysisLib = require('../index')

sentimentAnalysis = new sentimentAnalysisLib


describe 'doesWordExist will return boolean weather word exists', ()->

  it 'should return a boolean value', ()->
    expect(sentimentAnalysis.doesWordExist('coffee')).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist('mocha')).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist('java')).to.be.a('boolean')

  it 'should return true for words that exist', () ->
    expect(sentimentAnalysis.doesWordExist('woo')).to.be.true
    expect(sentimentAnalysis.doesWordExist('alive')).to.be.true
    expect(sentimentAnalysis.doesWordExist('awesome')).to.be.true
    expect(sentimentAnalysis.doesWordExist('anger')).to.be.true
    expect(sentimentAnalysis.doesWordExist('bright')).to.be.true
    expect(sentimentAnalysis.doesWordExist('love')).to.be.true
    expect(sentimentAnalysis.doesWordExist('easy')).to.be.true
    expect(sentimentAnalysis.doesWordExist('drunk')).to.be.true
    expect(sentimentAnalysis.doesWordExist('dumb')).to.be.true
    expect(sentimentAnalysis.doesWordExist('hacked')).to.be.true
    expect(sentimentAnalysis.doesWordExist('important')).to.be.true
    expect(sentimentAnalysis.doesWordExist('hug')).to.be.true
    expect(sentimentAnalysis.doesWordExist('itchy')).to.be.true
    expect(sentimentAnalysis.doesWordExist('laugh')).to.be.true
    expect(sentimentAnalysis.doesWordExist('stupid')).to.be.true
    expect(sentimentAnalysis.doesWordExist('bomb')).to.be.true

  it 'should return false for words that do not exist', () ->
    expect(sentimentAnalysis.doesWordExist('hello')).to.be.false
    expect(sentimentAnalysis.doesWordExist('world')).to.be.false
    expect(sentimentAnalysis.doesWordExist('everything')).to.be.false
    expect(sentimentAnalysis.doesWordExist('is')).to.be.false
    expect(sentimentAnalysis.doesWordExist('stupidness')).to.be.false
    expect(sentimentAnalysis.doesWordExist('acid')).to.be.false
    expect(sentimentAnalysis.doesWordExist('dinosaurs')).to.be.false
    expect(sentimentAnalysis.doesWordExist('laptop')).to.be.false
    expect(sentimentAnalysis.doesWordExist('pepsi')).to.be.false
    expect(sentimentAnalysis.doesWordExist('lorem')).to.be.false
    expect(sentimentAnalysis.doesWordExist('ipsum')).to.be.false
    expect(sentimentAnalysis.doesWordExist('squashed')).to.be.false
    expect(sentimentAnalysis.doesWordExist('watson')).to.be.false
    expect(sentimentAnalysis.doesWordExist('brain')).to.be.false

  it 'should not throw an error with funny values', ()->
    expect(sentimentAnalysis.doesWordExist(1)).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist([])).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist(true)).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist(undefined)).to.be.a('boolean')
    expect(sentimentAnalysis.doesWordExist(1)).to.be.false
    expect(sentimentAnalysis.doesWordExist([])).to.be.false
    expect(sentimentAnalysis.doesWordExist(undefined)).to.be.false



describe 'sentimentAnalysis.getScoreOfWord method return a sentiment score for that word', ()->
  # sentimentAnalysis.getScoreOfWord = sentimentAnalysis.sentimentAnalysis.getScoreOfWord

  it 'should return an integer', ()->
    expect(sentimentAnalysis.getScoreOfWord('amazing')).to.be.a('number')
    expect(sentimentAnalysis.getScoreOfWord('warm')).to.be.a('number')
    expect(sentimentAnalysis.getScoreOfWord('yummy')).to.be.a('number')

  it 'should be in a range of -5 to + 5', () ->
    expect(sentimentAnalysis.getScoreOfWord('nice')).to.be.above(-5).to.be.below(5)
    expect(sentimentAnalysis.getScoreOfWord('good')).to.be.below(5).to.be.below(5)
    expect(sentimentAnalysis.getScoreOfWord('great')).to.be.above(-5).to.be.below(5)
    expect(sentimentAnalysis.getScoreOfWord('awesome')).to.be.above(-5).to.be.below(5)

  it 'should return 0 if word doesn\'t exist, rather than crashing', ()->
    expect(sentimentAnalysis.getScoreOfWord('batman')).equal(0)
    expect(sentimentAnalysis.getScoreOfWord('superman')).equal(0)
    expect(sentimentAnalysis.getScoreOfWord('spiderman')).equal(0)
    expect(sentimentAnalysis.getScoreOfWord('pepperpig')).equal(0)

  it 'should return 0 if passed multiple words at a time that don\'t exist', ()->
    expect(sentimentAnalysis.getScoreOfWord('type error')).equal(0)
    expect(sentimentAnalysis.getScoreOfWord('everything is stupid')).equal(0)
    expect(sentimentAnalysis.getScoreOfWord('dinosaurs are awesome')).equal(0)

  it 'should return actual positive score for positive words that exist', ()->
    expect(sentimentAnalysis.getScoreOfWord('united')).equal(1)
    expect(sentimentAnalysis.getScoreOfWord('unstoppable')).equal(2)
    expect(sentimentAnalysis.getScoreOfWord('excited')).equal(3)
    expect(sentimentAnalysis.getScoreOfWord('win')).equal(4)
    expect(sentimentAnalysis.getScoreOfWord('outstanding')).equal(5)

  it 'should return actual negative score for negative words that exist', ()->
    expect(sentimentAnalysis.getScoreOfWord('fight')).equal(-1)
    expect(sentimentAnalysis.getScoreOfWord('fails')).equal(-2)
    expect(sentimentAnalysis.getScoreOfWord('evil')).equal(-3)
    expect(sentimentAnalysis.getScoreOfWord('fraud')).equal(-4)
    expect(sentimentAnalysis.getScoreOfWord('twat')).equal(-5)

  it 'should return 0 for neutral words that exist', ()->
    expect(sentimentAnalysis.getScoreOfWord('some kind')).equal(0)
    # There is only 1 neutral result in the AFINN word list!

describe 'getWordsInSentence will transform a sentence into a clean array', ()->

  it 'Should correctly turn a sentence into an array', ()->
    expect(sentimentAnalysis.getWordsInSentence('hello world')).eql(['hello', 'world'])
    expect(sentimentAnalysis.getWordsInSentence('this is a longer sentence'))
    .eql(['this', 'is', 'a', 'longer', 'sentence'])

  it 'Should normalise case', ()->
    expect(sentimentAnalysis.getWordsInSentence('HeLlO wOrLd')).eql(['hello', 'world'])
    expect(sentimentAnalysis.getWordsInSentence('JAVASCRIPT')).eql(['javascript'])

  it 'Should remove dupplicates', ()->
    expect(sentimentAnalysis.getWordsInSentence('foo foo bar foo'))
    .eql(['foo', 'bar'])
  expect(sentimentAnalysis.getWordsInSentence('foo foo BAR Foo bAr foO bar foo'))
  .eql(['foo', 'bar', ])

  it 'Should remove blanks', ()->
    expect(sentimentAnalysis.getWordsInSentence('space       blank        '))
    .eql(['space', 'blank'])

  it 'Should remove special characters', ()->
    expect(sentimentAnalysis.getWordsInSentence('foo ! ^&*^&^%^%&^^&%%^bar$$%^'))
    .eql(['foo', 'bar'])

  it 'Should handle phrase words', ()->
    expect(sentimentAnalysis.getWordsInSentence('cool stuff cashing in'))
    .eql(['CoolStuff', 'CashingIn'])

describe 'removeDupplicates should remove dupplicates from an array', () ->
  removeDupplicates = sentimentAnalysis.constructor.removeDuplicates

  it 'should remove duplicates', () ->
    expect(removeDupplicates(['hello', 'world', 'hello', 'hello']))
    .eql(['hello', 'world'])

describe 'scaleScore should ensure the score is within the valid range', () ->
  scaleScore = sentimentAnalysis.constructor.scaleScore

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

describe 'isPhrase should detect words composed by multiple words', () ->
  isPhrase = sentimentAnalysis.constructor.isPhrase

  it 'should not be a phrase for single words', () ->
    expect(isPhrase('nice')).to.be.false
    expect(isPhrase('good')).to.be.false
    expect(isPhrase('great')).to.be.false
    expect(isPhrase('awesome')).to.be.false

  it 'should be a phrase for multiple words', () ->
    expect(isPhrase('cashing in')).to.be.true
    expect(isPhrase('cool stuff')).to.be.true
    expect(isPhrase('does not work')).to.be.true
    expect(isPhrase('dont like')).to.be.true

describe 'compressPhrase should camelize phrases', () ->
  compressPhrase = sentimentAnalysis.constructor.compressPhrase

  it 'should camelize', () ->
    expect(compressPhrase('cashing in')).to.be.equal('CashingIn')
    expect(compressPhrase('cool stuff')).to.be.equal('CoolStuff')
    expect(compressPhrase('does not work')).to.be.equal('DoesNotWork')
    expect(compressPhrase('dont like')).to.be.equal('DontLike')

  it 'afinnWordList should contain camelized version of phrases', () ->
    expect(sentimentAnalysis.afinnWordList.CashingIn).to.be.a('number')
    expect(sentimentAnalysis.afinnWordList.CoolStuff).to.be.a('number')
    expect(sentimentAnalysis.afinnWordList.DoesNotWork).to.be.a('number')
