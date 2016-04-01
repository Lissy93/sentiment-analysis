(function() {
  var Analizer, sentimentAnalysisPath;

  sentimentAnalysisPath = __dirname;

  module.exports = Analizer = (function() {
    function Analizer(opts) {
      var compressedWord, i, ref, ref1, value, word;
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
      this.afinnPhrases = [];
      this.afinnPhrasesCamel = [];
      ref1 = this.afinnWordList;
      for (word in ref1) {
        value = ref1[word];
        if (this.constructor.isPhrase(word)) {
          compressedWord = this.constructor.compressPhrase(word);
          this.afinnPhrases.push(word);
          this.afinnPhrasesCamel.push(compressedWord);
          this.afinnWordList[compressedWord] = value;
        }
      }
    }

    Analizer.prototype.analyseSentence = function(sentence) {
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

    Analizer.prototype.doesWordExist = function(word) {
      return word in this.afinnWordList;
    };

    Analizer.prototype.getScoreOfWord = function(word) {
      return this.afinnWordList[word] || 0;
    };

    Analizer.prototype.getWordsInSentence = function(sentence) {
      var i, j, len, ref, word;
      sentence = sentence || '';
      sentence = typeof sentence === 'string' ? sentence.toLowerCase() : '';
      sentence = sentence.replace(/(?:https?|ftp):\/\/[\n\S]+/g, '');
      sentence = sentence.replace(/[^\w\s]/gi, '');
      ref = this.afinnPhrases;
      for (i = j = 0, len = ref.length; j < len; i = ++j) {
        word = ref[i];
        sentence = sentence.replace(word, this.afinnPhrasesCamel[i]);
      }
      sentence = sentence.split(' ');
      sentence = sentence.filter(function(n) {
        return n !== '';
      });
      return this.constructor.removeDuplicates(sentence);
    };

    Analizer.removeDuplicates = function(arr) {
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

    Analizer.scaleScore = function(score) {
      score = score > 10 ? 10 : score;
      score = score < -10 ? -10 : score;
      return score / 10;
    };

    Analizer.isPhrase = function(word) {
      return word.indexOf(' ') !== -1;
    };

    Analizer.compressPhrase = function(phrase) {
      var w;
      return ((function() {
        var j, len, ref, results;
        ref = phrase.split(/\s+/);
        results = [];
        for (j = 0, len = ref.length; j < len; j++) {
          w = ref[j];
          results.push(w[0].toUpperCase() + w.slice(1).toLowerCase());
        }
        return results;
      })()).join('');
    };

    return Analizer;

  })();

}).call(this);
/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           *\
|* (C) Maurizio Carboni <mcarboni@redant.com> 2016          *|
\* MIT License. Read full license at: https://goo.gl/IL4lQJ */