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
var sentimentAnalysis = require('sentiment-analysis');

sentimentAnalysis('Dinosaurs are awesome!'); // +0.4
sentimentAnalysis('Everything is stupid');  // -0.2
sentimentAnalysis('Windows is very unstable');  // -0.2
sentimentAnalysis('London is gloomy today because of all the smog');  // -0.4
sentimentAnalysis('I am so grateful for all the presents, thank you!');  // +0.5
sentimentAnalysis('Really enjoying the warm weather');  // +0.3
sentimentAnalysis('It was a catastrophic disaster');  // -0.6
```
sentiment-analysis will return a score between -1 and +1, where negative numbers represent a negative overall sentiment.


## Testing
`npm test`

See unit test, integration testing results on [Travis CI]

## Development
See the `gulpfile.js` for documentation of build process.

## License
MIT © [Alicia Sykes](http://aliciasykes.com)

[AFINN-111]: <http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010>
[Travis CI]: <https://travis-ci.org/Lissy93/sentiment-analysis>