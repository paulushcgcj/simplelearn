import { Octokit } from "@octokit/rest";
import { appendFileSync } from 'fs';

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
    
    let updatedTitle;

    if (issue.title === "[Test Case]: REPLACE WITH YOUR TEST CASE TITLE") {
      
      console.warn('No issue title provided, updating the issue title with the test case title');

      const authorName = `Automated test case #${issueNumber} opened by ${issue.user?.login || 'unknown'}`;
      updatedTitle = issue.title.replace("REPLACE WITH YOUR TEST CASE TITLE", authorName).trim();
      
      await octokit.issues.update({
        owner,
        repo,
        issue_number: issueNumber,
        title: newIssueTitle,
        body: issue.body
      });
    } else {
      updatedTitle = issue.title;
    }

    updatedTitle = updatedTitle.replace("[Test Case]: ", "");
    appendFileSync(process.env.GITHUB_OUTPUT, `title=${updatedTitle}\n`);


  } catch (error) {
    console.error('Error fetching and/or updating issue data:', error);
    process.exit(1);
  }
})();
