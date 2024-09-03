const MarkdownIt = require('markdown-it');
const md = new MarkdownIt();
const fs = require('fs');

// Get the issue title and body as command-line arguments
const [,, issueTitle, issueBody] = process.argv;

// Parse the markdown content
const tokens = md.parse(issueBody, {});
let gherkinText = '';

// Look for the gherkin code block
tokens.forEach(token => {
  if (token.type === 'fence' && token.info === 'gherkin') {
    gherkinText = token.content;
  }
});

if (!gherkinText) {
  console.error('Error: No Gherkin content found in the issue body.');
  process.exit(1);
}

// Sanitize the issue title to create a safe filename
const sanitizedTitle = issueTitle.replace('[Test Case]:', '').replace(/[^a-z0-9]+/gi, '-').toLowerCase();

// Write the Gherkin content to a .feature file
fs.writeFileSync(`./${sanitizedTitle}.feature`, gherkinText.trim());

console.log(`Gherkin feature file created: ${sanitizedTitle}.feature`);
