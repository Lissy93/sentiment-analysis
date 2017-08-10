
// Include the sentiment-analysis module
// You will first need to install it (npm install sentiment-analysis --save)
// See full documentation at: https://github.com/Lissy93/sentiment-analysis

// This like will then actuall be:
// const sentimentAnalysis = require('sentiment-analysis');
const sentimentAnalysis = require('./index.js');

/**
 * Gets the sentiment of a sentence
 * using the sentiment-analysis module
 * formats it, and prints to console
*/
function displaySentiment(inputText, sentimentScore){

 // Determine if the score is positive, neutral or negative
  let overallSentiment = 'neutral';
  if (sentimentScore > 0.2) overallSentiment = 'positive';
  else if (sentimentScore < -0.2) overallSentiment = 'negative';

  // Get persnt from score
  const persentageScore = `${sentimentScore * 100}%`;

  // This is the sentence to return (e.g. 40% positive)
  const sentence = `${persentageScore} (${overallSentiment})  `;

  return sentence;
}

/**
* Returns a color to represent the sentimentScore
* Either green, yellow or red. In the console format
*/
function getChalkColor(sentimentScore){
  let chalkColor = '\x1b[33m';
  if(sentimentScore > 0.2) chalkColor = '\x1b[32m';
  else if(sentimentScore < -0.2) chalkColor = '\x1b[31m';
  return chalkColor;
}

// Array of example text, to calculate sentiments from
const exampleText = [
  'I am so angry about this useles product that fraudster sold me',
  'Really cant be bothered with this dumb assignment, will do it tomorrow',
  'What a gloomy day in London, wish the smog would lift a little',
  'Going to write my next app in Node.js, as I like it so much more then C#',
  'Whos in town tonight, and wants to head to the City Arms to watch the match?',
  'Though the latest iPhone is ok, I still dont like it compared to Android',
  'Just discovered the chip sandwitch, best end to a great night out ever!',
  'Congratulations to my best friend who has just married her lovely man!',
  'Super happy about the great result for England in that terrific football match'
];

// Iterate though each sentence, calculate sentiment and color, then print to console
for (var text of exampleText) {

  const sentiment = sentimentAnalysis(text); // Get the senitment score
  const color = getChalkColor(sentiment); // Get a colour to represent score
  const resetColor = '\x1b[36m'; // Default text color

  // Actuall print the results to the console (in color!)
  console.log(color, displaySentiment(text, sentiment), resetColor, '\t'+text);
}
