(function() {
  var afinnWordList, analyseSentence, doesWordExist, getScoreOfWord, getWordsInSentence;

  afinnWordList = require('./AFINN-111.json');

  doesWordExist = function(word) {
    return true;
  };

  getScoreOfWord = function(word) {
    return 0;
  };

  getWordsInSentence = function(sentence) {
    return [];
  };

  analyseSentence = function(sentence) {
    return 0;
  };

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */