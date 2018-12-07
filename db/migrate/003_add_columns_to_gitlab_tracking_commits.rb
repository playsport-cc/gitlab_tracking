class AddColumnsToGitlabTrackingCommits < ActiveRecord::Migration
  def self.up
    add_column :gitlab_tracking_commits, :merge_request_id, :integer
    add_column :gitlab_tracking_commits, :merge_request_url, :string, :limit => 4096
  end

  def self.down
    remove_column :gitlab_tracking_commits, :merge_request_id
  end
end