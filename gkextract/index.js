import { Octokit } from "@octokit/rest";
import MarkdownIt from 'markdown-it';
import { writeFileSync } from 'fs';

// Initialize the GitHub client with the token
const octokit = new Octokit({ auth: process.env.GITHUB_TOKEN });

// GitHub repository information
const owner = process.env.GITHUB_REPOSITORY_OWNER;
const repo = process.env.GITHUB_REPOSITORY.split("/")[1];
const issueNumber = process.env.ISSUE_NUMBER;
const basePath = process.env.BASE_PATH;

console.log(`Extracting Gherkin content from issue #${issueNumber} in ${owner}/${repo}...`);

(async () => {
  try {
    // Fetch the issue data from GitHub
    const { data: issue } = await octokit.issues.get({
      owner,
      repo,
      issue_number: issueNumber
    });

    const issueBody = issue.body;

    // Parse the markdown content
    const md = new MarkdownIt();
    const tokens = md.parse(issueBody, {});
    let gherkinText = '';

    // Look for the Gherkin code block
    tokens.forEach(token => {
      if (token.type === 'fence' && token.info === 'gherkin') {
        gherkinText = token.content;
      }
    });

    if (!gherkinText) {
      console.error('Error: No Gherkin content found in the issue body.');
      process.exit(1);
    }

    // Generate a file name based on the issue number
    const sanitizedTitle = `upt_${issueNumber}`.toLowerCase();

    // Write the Gherkin content to a .feature file
    const filePath = `${basePath}/${sanitizedTitle}.feature`;
    writeFileSync(filePath, gherkinText.trim());

    console.log(`Gherkin feature file created: ${filePath}`);
  } catch (error) {
    console.error('Error fetching issue data:', error);
    process.exit(1);
  }
})();
