class AddColumnsToGitlabTrackingCommits < ActiveRecord::Migration
  def change
    add_column :gitlab_tracking_commits, :merge_request_id, :integer
    add_column :gitlab_tracking_commits, :merge_request_url, :string, :limit => 4096
  end
end