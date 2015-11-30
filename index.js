(function() {
    var sentimentAnalysisPath = __dirname;

  function analizer(opts) {
      this.afinnWordList = require(sentimentAnalysisPath + '/AFINN-111.json');
      if (opts) {
          if (opts.customWordsFile) {
              opts.customWords = require(opts.customWordsFile);
          }
          if (opts.customWords) {
              for (var i in opts.customWords) {
                  this.afinnWordList[i] = opts.customWords[i];
              }
          }
      }
  }

  analizer.prototype.analyseSentence = function(sentence) {
    var i, len, score, word, wordsArr;
    score = 0;
    wordsArr = this.getWordsInSentence(sentence);
    for (i = 0, len = wordsArr.length; i < len; i++) {
      word = wordsArr[i];
      if (this.doesWordExist(word)) {
        score += this.getScoreOfWord(word);
      }
    }
    return this.scaleScore(score);
  };

  analizer.prototype.doesWordExist = function(word) {
    if (word in this.afinnWordList) {
      return true;
    } else {
      return false;
    }
  };

  analizer.prototype.getScoreOfWord = function(word) {
    if (this.afinnWordList[word]) {
      return this.afinnWordList[word];
    } else {
      return 0;
    }
  };

  analizer.prototype.getWordsInSentence = function(sentence) {
    sentence = sentence !== null ? sentence : '';
    sentence = typeof sentence === 'string' ? sentence : '';
    sentence = sentence.toLowerCase().replace(/(?:https?|ftp):\/\/[\n\S]+/g, '').replace(/[^\w\s]/gi, '');
    sentence = sentence.split(' ').filter(function(n) {
      return n !== '';
    });
    return this.removeDuplicates(sentence);
  };

  analizer.prototype.removeDuplicates = function(arr) {
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

  analizer.prototype.scaleScore = function(score) {
    score = score > 10 ? 10 : score;
    score = score < -10 ? -10 : score;
    return score / 10;
  };

  module.exports = analizer;

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */
