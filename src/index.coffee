
afinnWordList = require './AFINN-111.json' # Get the JSON AFINN-111 word list

# Returns a boolean true if given word is found in word list
doesWordExist = (word)->
  if word of afinnWordList then true else false

# Returns an integer value + or - sentiment score for given word
getScoreOfWord = (word)->
  0

# Formats sentence and returns a lowercase a-z array of words
getWordsInSentence = (sentence)->
  []

# Returns an overall sentiment score for sentence
analyseSentence = (sentence) ->
  0


module.exports = analyseSentence # Export main method as module


# If we're developing/ testing then export the private methods too
if process.env.NODE_ENV == 'test'
  module.exports =
    main: analyseSentence
    _private:
      doesWordExist: doesWordExist
      getScoreOfWord: getScoreOfWord
      getWordsInSentence: getWordsInSentence