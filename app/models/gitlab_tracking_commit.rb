class GitlabTrackingCommit < ActiveRecord::Base
  unloadable
  belongs_to :issue


  class << self

    def parse_commit_and_create(issue, branch, commit)
      gtc = new
      gtc.issue = issue
      gtc.branch = branch
      gtc.author_email = commit['author']['email']
      gtc.author_name = commit['author']['name']
      gtc.timestamp = Time.parse(commit['timestamp'])
      gtc.git_hash = commit['id']
      gtc.gitlab_url = commit['url']
      gtc.message = commit['message']
      gtc.save if where(issue_id: gtc.issue, git_hash: gtc.git_hash).size == 0
    end

    def parse_pr_and_create(issue, branch, attribute, last_commit)
      gtc = new
      gtc.issue = issue
      gtc.branch = branch

      gtc.merge_request_id = attribute['id']
      gtc.merge_request_url = attribute['url']

      # commit
      gtc.author_email = last_commit['author']['email']
      gtc.author_name = last_commit['author']['name']
      gtc.timestamp = Time.parse(last_commit['timestamp'])
      gtc.git_hash = last_commit['id']
      gtc.gitlab_url = last_commit['url']
      gtc.message = last_commit['message']
      gtc.save if where(issue_id: gtc.issue, merge_request_id: gtc.merge_request_id).size == 0
    end
  end

end
