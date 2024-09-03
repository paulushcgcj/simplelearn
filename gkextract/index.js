const MarkdownIt = require('markdown-it');
const md = new MarkdownIt();
const body = process.env.ISSUE_BODY;
const tokens = md.parse(body, {});
let gherkinText = '';
tokens.forEach(token => {
  if (token.type === 'fence' && token.info === 'gherkin') {
    gherkinText = token.content;
  }
});
console.log(gherkinText);
const fs = require('fs');
const sanitizedTitle = process.env.ISSUE_TITLE.replace('[Test Case]:','').replace(/[^a-z0-9]+/gi, '-').toLowerCase();
fs.writeFileSync(`./${sanitizedTitle}.feature`, gherkinText.trim());
