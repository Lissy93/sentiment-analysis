<!-- Title + Description -->
<h1 align="center">Sentiment Analysis</h1>
<p align="center">
  <i>A light-weight sentiment analysis NPM module, based on the AFINN-111 word list</i>
  <br><br>
   <a href="https://travis-ci.org/Lissy93/sentiment-analysis" title="Build"><img src="https://travis-ci.org/Lissy93/sentiment-analysis.svg?branch=dev" /></a>
  <a href="https://snyk.io/test/github/Lissy93/sentiment-analysis/" title="Security"><img src="https://snyk.io/test/github/Lissy93/sentiment-analysis/badge.svg" /></a>
  <a href="https://www.npmjs.com/package/sentiment-analysis"><img src="https://img.shields.io/npm/dt/sentiment-analysis" /></a>
  <a href="https://bundlephobia.com/package/sentiment-analysis@0.1.2"><img src="https://img.shields.io/bundlephobia/minzip/sentiment-analysis?color=success" /></a>
  <a href="https://codeclimate.com/github/Lissy93/sentiment-analysis/maintainability"><img src="https://api.codeclimate.com/v1/badges/d122350f54e987951c4d/maintainability" /></a>
  <a href="https://github.com/Lissy93/sentiment-analysis#license"><img src="https://img.shields.io/npm/l/sentiment-analysis?color=success" /></a>
</p>

<!-- Line Break -->
<hr />

### Usage

Simply install [`sentiment-analysis`](https://www.npmjs.com/package/sentiment-analysis) via Yarn/ NPM/ pnpm, then import and use it.

```bash
npm i sentiment-analysis
```

```javascript
sentimentAnalysis = require('sentiment-analysis');

sentimentAnalysis('Dinosaurs are awesome!'); // +0.4
sentimentAnalysis('Everything is stupid');  // -0.2
sentimentAnalysis('JavaScript sucks'); // -0.3
sentimentAnalysis('My life is a catastrophic disaster');  // -0.6
```

For a more detailed usage example, see [this example Gist](https://gist.github.com/Lissy93/0d9a3d5dc9d9c49c7b4b9319a7715703)

---

### Developing

To make changes, clone the project, cd into it, install dev dependencies then start Gulp watch.

```bash
git clone git@github.com:Lissy93/sentiment-analysis.git
cd sentiment-analysis
npm i
```

The entry point, and bulk of the logic is in the [`index.coffee`](https://github.com/Lissy93/sentiment-analysis/blob/master/index.coffee) file.

The following scripts are availible:
- `npm run dev` - Watch for file changes and rebuild the project for development
- `npm run build` - Run tests, then lint, compile and minify the project for production
- `npm run test` - Execute unit tests, quality gates, and coverage
- `npm run example` - Run the example script

---

### Testing

After cloning, run `yarn test` to execute the unit tests and generate quality and coverage report. The following files will be executed:

- [`utils.test.coffee`](https://github.com/Lissy93/sentiment-analysis/blob/master/test/utils.test.coffee) - All utility unit tests
- [`main.test.coffee`](https://github.com/Lissy93/sentiment-analysis/blob/master/test/main.test.coffee) - Main integration tests

Any new features added must be tested, and all tests must be passing before any changes can be merged.

---

### Contributing

Contributions are welcome :)
Please be sure to follow the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).

---

### License

<sup>For license explanation, see [TLDR Legal > MIT](https://tldrlegal.com/license/mit-license)</sup>

```
The MIT License (MIT)
Copyright (c) Alicia Sykes <alicia@omg.com> 

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the "Software"), to deal 
in the Software without restriction, including without limitation the rights 
to use, copy, modify, merge, publish, distribute, sub-license, and/or sell 
copies of the Software, and to permit persons to whom the Software is furnished 
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included install 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT ABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


<!-- Line Break -->
<hr />

<!-- License + Copyright -->
<p  align="center">
  <i>© <a href="https://aliciasykes.com">Alicia Sykes</a> 2015</i><br>
  <i>Licensed under <a href="https://gist.github.com/Lissy93/143d2ee01ccc5c052a17">MIT</a></i><br>
  <a href="https://github.com/lissy93"><img src="https://i.ibb.co/4KtpYxb/octocat-clean-mini.png" /></a><br>
  <sup>Thanks for visiting :)</sup>
</p>

<!-- Dinosaur -->
<!-- 
                        . - ~ ~ ~ - .
      ..     _      .-~               ~-.
     //|     \ `..~                      `.
    || |      }  }              /       \  \
(\   \\ \~^..'                 |         }  \
 \`.-~  o      /       }       |        /    \
 (__          |       /        |       /      `.
  `- - ~ ~ -._|      /_ - ~ ~ ^|      /- _      `.
              |     /          |     /     ~-.     ~- _
              |_____|          |_____|         ~ - . _ _~_-_
-->
