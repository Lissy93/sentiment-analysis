# sentiment-analysis
[![Build Status](https://travis-ci.org/Lissy93/sentiment-analysis.svg?branch=dev)](https://travis-ci.org/Lissy93/sentiment-analysis)
[![Dependency Status](https://david-dm.org/lissy93/sentiment-analysis.svg)](https://david-dm.org/lissy93/sentiment-analysis)
[![devDependency Status](https://david-dm.org/lissy93/sentiment-analysis/dev-status.svg)](https://david-dm.org/lissy93/sentiment-analysis#info=devDependencies)
[![Code Climate](https://codeclimate.com/github/Lissy93/sentiment-analysis/badges/gpa.svg)](https://codeclimate.com/github/Lissy93/sentiment-analysis)
> [AFINN-111] based Sentiment analysis module

## Install
`npm install sentiment-analysis --save`

## Usage
```javascript
var sentimentAnalysisLib = require('sentiment-analysis');
var sentimentAnalysis = new sentimentAnalysisLib();

sentimentAnalysis.analyseSentence('Dinosaurs are awesome!'); // +0.4
sentimentAnalysis.analyseSentence('Everything is stupid');  // -0.2
sentimentAnalysis.analyseSentence('Windows is very unstable');  // -0.2
sentimentAnalysis.analyseSentence('London is gloomy today because of all the smog');  // -0.4
sentimentAnalysis.analyseSentence('I am so grateful for all the presents, thank you!');  // +0.5
sentimentAnalysis.analyseSentence('Really enjoying the warm weather');  // +0.3
sentimentAnalysis.analyseSentence('It was a catastrophic disaster');  // -0.6
```
sentiment-analysis will return a score between -1 and +1, where negative numbers represent a negative overall sentiment.

### Options

*Custom file*
```javascript
var sentimentAnalysisLib = require('sentiment-analysis');
var sentimentAnalysis = new sentimentAnalysisLib({
	customWordsFile : 'myCustomAfinn.json'
});

sentimentAnalysis.analyseSentence('Dinosaurs are awesome!');
```

*Custom words*
```javascript
var sentimentAnalysisLib = require('sentiment-analysis');
var sentimentAnalysis = new sentimentAnalysisLib({
	customWords : {
		dinosaurs : -4
	}
});

sentimentAnalysis.analyseSentence('Dinosaurs are awesome!'); // 0
```


## Testing
`npm test`

See unit test, integration testing results on [Travis CI]

## Development
See the `gulpfile.js` for documentation of build process.

## License
MIT � [Alicia Sykes](http://aliciasykes.com), [Maurizio Carboni](https://www.linkedin.com/in/mauriziocarboni)

[AFINN-111]: <http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010>
[Travis CI]: <https://travis-ci.org/Lissy93/sentiment-analysis>
