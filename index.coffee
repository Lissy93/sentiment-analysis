sentimentAnalysisPath = __dirname

module.exports = class Analizer
  constructor: ( opts ) ->
    # Include inside the class the wordlist
    @afinnWordList = require(sentimentAnalysisPath + '/AFINN-111.json')
    if opts
      # If using a custom file, load it
      if opts.customWordsFile
        opts.customWords = require(opts.customWordsFile)
      # if using custom words
      # ( in case of custom file, this words are loaded from the file )
      if opts.customWords
        # Overwrite existing words
        for i,word of opts.customWords
          @afinnWordList[i] = word
    @afinnPhrases = []
    @afinnPhrasesCamel = []
    for word,value of @afinnWordList
      if @constructor.isPhrase(word)
        compressedWord = @constructor.compressPhrase(word)
        @afinnPhrases.push word
        @afinnPhrasesCamel.push compressedWord
        @afinnWordList[compressedWord] = value

  # Returns an overall sentiment score for sentence
  analyseSentence: ( sentence ) ->
    score = 0
    wordsArr = @getWordsInSentence(sentence)
    for word in wordsArr
      if @doesWordExist(word)
        score += @getScoreOfWord(word)
    @constructor.scaleScore(score)

  # Returns a boolean true if given word is found in word list
  doesWordExist: ( word ) ->
    word of @afinnWordList

  # Returns an integer value + or - sentiment score for given word
  getScoreOfWord: ( word ) ->
    @afinnWordList[word] || 0


  # Formats sentence and returns a lowercase a-z array of words
  getWordsInSentence: ( sentence ) ->
    sentence = sentence || '' # Double check is defined
    sentence = if typeof sentence == 'string'then sentence.toLowerCase() else ''
    sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '') # Remove URLs
    sentence = sentence.replace(/[^\w\s]/gi, '')  # Remove special characters
    # Replace phrases with the camelized version
    for word,i in @afinnPhrases
      sentence = sentence.replace(word, @afinnPhrasesCamel[i])
    sentence = sentence.split(' ')                # Split into an array
    sentence = sentence.filter((n) -> n != '')    # Remove blanks
    @constructor.removeDuplicates(sentence)

  # Remove Duplicates
  @removeDuplicates: ( arr ) ->
    if arr.length == 0
      return []
    res = {}
    res[arr[key]] = arr[key] for key in [0..arr.length-1]
    value for key, value of res

  # Ensure score is in a valid range between -1 to +1
  @scaleScore: ( score ) ->
    score = if score > 10 then 10 else score
    score = if score < -10 then -10 else score
    score/10

  @isPhrase: ( word ) ->
    word.indexOf(' ') != -1

  @compressPhrase: ( phrase ) ->
    (w[0].toUpperCase() + w[1..-1].toLowerCase() for w in phrase.split /\s+/)
    .join ''
