sentimentAnalysisPath = __dirname;

module.exports = class analizer
  constructor: ( opts ) ->
    # Include inside the class the wordlist
    @afinnWordList = require(sentimentAnalysisPath + '/AFINN-111.json');
    if opts
      # If using a custom file, load it
      if opts.customWordsFile
        opts.customWords = require(opts.customWordsFile);
      # if using custom words ( in case of custom file, this words are loaded from the file )
      if opts.customWords
        # Overwrite existing words
        for i,word of opts.customWords
          @afinnWordList[i] = word;

  # Returns an overall sentiment score for sentence
  analyseSentence: ( sentence ) ->
    score = 0
    wordsArr = @getWordsInSentence(sentence);
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
    sentence = if typeof sentence == 'string' then sentence.toLowerCase() else ''
    sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '') # Remove URLs
    sentence = sentence.replace(/[^\w\s]/gi, '')  # Remove special characters
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
  @scaleScore: ( score )->
    score = if score > 10 then 10 else score
    score = if score < -10 then -10 else score
    score/10
