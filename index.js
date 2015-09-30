(function() {
  var afinnWordList, analyseSentence, doesWordExist, getScoreOfWord, getWordsInSentence, removeDuplicates;

  afinnWordList = require(__dirname + '/AFINN-111.json');

  doesWordExist = function(word) {
    if (word in afinnWordList) {
      return true;
    } else {
      return false;
    }
  };

  getScoreOfWord = function(word) {
    if (afinnWordList[word]) {
      return afinnWordList[word];
    } else {
      return 0;
    }
  };

  getWordsInSentence = function(sentence) {
    sentence = sentence != null ? sentence : '';
    sentence = typeof sentence === 'string' ? sentence : '';
    sentence = sentence.toLowerCase();
    sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '');
    sentence = sentence.replace(/[^\w\s]/gi, '');
    sentence = sentence.split(' ');
    sentence = sentence.filter(function(n) {
      return n !== '';
    });
    return sentence = removeDuplicates(sentence);
  };

  removeDuplicates = function(arr) {
    var i, key, ref, res, results, value;
    if (arr.length === 0) {
      return [];
    }
    res = {};
    for (key = i = 0, ref = arr.length - 1; 0 <= ref ? i <= ref : i >= ref; key = 0 <= ref ? ++i : --i) {
      res[arr[key]] = arr[key];
    }
    results = [];
    for (key in res) {
      value = res[key];
      results.push(value);
    }
    return results;
  };

  analyseSentence = function(sentence) {
    var i, len, score, word, wordsArr;
    score = 0;
    wordsArr = getWordsInSentence(sentence);
    for (i = 0, len = wordsArr.length; i < len; i++) {
      word = wordsArr[i];
      if (doesWordExist(word)) {
        score += getScoreOfWord(word);
      }
    }
    score = score > 10 ? 10 : score;
    score = score < -10 ? -10 : score;
    return score;
  };

  module.exports = analyseSentence;

  if (process.env.NODE_ENV === 'test') {
    module.exports = {
      main: analyseSentence,
      _private: {
        doesWordExist: doesWordExist,
        getScoreOfWord: getScoreOfWord,
        removeDuplicates: removeDuplicates,
        getWordsInSentence: getWordsInSentence
      }
    };
  }

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */