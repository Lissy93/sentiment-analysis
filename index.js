(function() {
  var afinnWordList, analyseSentence, doesWordExist, getScoreOfWord, getWordsInSentence;

  afinnWordList = require('./AFINN-111.json');

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
    return [];
  };

  analyseSentence = function(sentence) {
    console.log(getScoreOfWord('fails'));
    return 0;
  };

  module.exports = analyseSentence;

  if (process.env.NODE_ENV === 'test') {
    module.exports = {
      main: analyseSentence,
      _private: {
        doesWordExist: doesWordExist,
        getScoreOfWord: getScoreOfWord,
        getWordsInSentence: getWordsInSentence
      }
    };
  }

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */