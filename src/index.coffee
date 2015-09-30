
afinnWordList = require __dirname + '/AFINN-111.json' # Get the AFINN-111 list

# Returns a boolean true if given word is found in word list
doesWordExist = (word)->
  if word of afinnWordList then true else false

# Returns an integer value + or - sentiment score for given word
getScoreOfWord = (word)->
  if afinnWordList[word] then afinnWordList[word] else 0

# Formats sentence and returns a lowercase a-z array of words
getWordsInSentence = (sentence)->
  sentence = if sentence? then sentence else '' # Double check is defined
  sentence = if typeof sentence == 'string' then sentence else ''
  sentence = sentence.toLowerCase()
  sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '') # Remove URLs
  sentence = sentence.replace(/[^\w\s]/gi, '')  # Remove special characters
  sentence = sentence.split(' ')                # Split into an array
  sentence = sentence.filter((n) -> n != '')    # Remove blanks
  sentence = removeDuplicates(sentence)

# Remove Duplicates
removeDuplicates = (arr) ->
  if arr.length == 0
    return []
  res = {}
  res[arr[key]] = arr[key] for key in [0..arr.length-1]
  value for key, value of res

# Returns an overall sentiment score for sentence
analyseSentence = (sentence) ->
  score = 0
  wordsArr = getWordsInSentence(sentence)
  for word in wordsArr
    if doesWordExist(word)
      score += getScoreOfWord(word)
  score = if score > 10 then 10 else score
  score = if score < -10 then -10 else score
  score

module.exports = analyseSentence # Export main method as module


# If we're developing/ testing then export the private methods too
if process.env.NODE_ENV == 'test'
  module.exports =
    main: analyseSentence
    _private:
      doesWordExist: doesWordExist
      getScoreOfWord: getScoreOfWord
      removeDuplicates: removeDuplicates
      getWordsInSentence: getWordsInSentence
