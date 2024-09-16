import { Octokit } from "@octokit/rest";
import MarkdownIt from 'markdown-it';
import { writeFileSync } from 'fs';

// Initialize the GitHub client with the token
const octokit = new Octokit({ auth: process.env.GITHUB_TOKEN });

// GitHub repository information
const owner = process.env.GITHUB_REPOSITORY_OWNER;
const repo = process.env.GITHUB_REPOSITORY.split("/")[1];
const issueNumber = process.env.ISSUE_NUMBER;

console.log(`Formatting content from issue #${issueNumber} in ${owner}/${repo}...`);

(async () => {
  try {
    // Fetch the issue data from GitHub
    const { data: issue } = await octokit.issues.get({
      owner,
      repo,
      issue_number: issueNumber
    });

    const issueTitle = issue.title;
    const issueBody = issue.body;

    // Verify if the issue title is not [Test Case]: REPLACE WITH YOUR TEST CASE TITLE
    if (issueTitle !== "[Test Case]: REPLACE WITH YOUR TEST CASE TITLE") {
      // Replace the text "REPLACE WITH YOUR TEST CASE" with the name of the author of the issue
      const authorName = issue.user?.login || `Automated test case #${issueNumber}`;
      const newIssueTitle = issueTitle.replace("REPLACE WITH YOUR TEST CASE TITLE", authorName).trim();
      //TODO: update the github issue title with the newIssueTitle
    }

    // Read the issue body as markdown
    const md = new MarkdownIt();
    const parsedIssueBody = md.render(issueBody);

    // Replace the fence token "shell" with "gherkin"
    const updatedIssueBody = parsedIssueBody.replace(/```shell/g, "```gherkin");
    //TODO: update the github issue body with the updatedIssueBody




  } catch (error) {
    console.error('Error fetching issue data:', error);
    process.exit(1);
  }
})();
