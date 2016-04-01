(function() {
  var analizer, sentimentAnalysisPath;

  sentimentAnalysisPath = __dirname;

  module.exports = analizer = (function() {
    function analizer(opts) {
      var i, ref, word;
      this.afinnWordList = require(sentimentAnalysisPath + '/AFINN-111.json');
      if (opts) {
        if (opts.customWordsFile) {
          opts.customWords = require(opts.customWordsFile);
        }
        if (opts.customWords) {
          ref = opts.customWords;
          for (i in ref) {
            word = ref[i];
            this.afinnWordList[i] = word;
          }
        }
      }
    }

    analizer.prototype.analyseSentence = function(sentence) {
      var j, len, score, word, wordsArr;
      score = 0;
      wordsArr = this.getWordsInSentence(sentence);
      for (j = 0, len = wordsArr.length; j < len; j++) {
        word = wordsArr[j];
        if (this.doesWordExist(word)) {
          score += this.getScoreOfWord(word);
        }
      }
      return this.constructor.scaleScore(score);
    };

    analizer.prototype.doesWordExist = function(word) {
      return word in this.afinnWordList;
    };

    analizer.prototype.getScoreOfWord = function(word) {
      return this.afinnWordList[word] || 0;
    };

    analizer.prototype.getWordsInSentence = function(sentence) {
      sentence = sentence || '';
      sentence = typeof sentence === 'string' ? sentence.toLowerCase() : '';
      sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '');
      sentence = sentence.replace(/[^\w\s]/gi, '');
      sentence = sentence.split(' ');
      sentence = sentence.filter(function(n) {
        return n !== '';
      });
      return this.constructor.removeDuplicates(sentence);
    };

    analizer.removeDuplicates = function(arr) {
      var j, key, ref, res, results, value;
      if (arr.length === 0) {
        return [];
      }
      res = {};
      for (key = j = 0, ref = arr.length - 1; 0 <= ref ? j <= ref : j >= ref; key = 0 <= ref ? ++j : --j) {
        res[arr[key]] = arr[key];
      }
      results = [];
      for (key in res) {
        value = res[key];
        results.push(value);
      }
      return results;
    };

    analizer.scaleScore = function(score) {
      score = score > 10 ? 10 : score;
      score = score < -10 ? -10 : score;
      return score / 10;
    };

    return analizer;

  })();

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
|* (C) Maurizio Carboni <mcarboni@redant.com> 2016          *|
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */