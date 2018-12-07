class AddTitleColumnToGitlabTrackingCommits < ActiveRecord::Migration
  def change
    add_column :gitlab_tracking_commits, :title, :string, :limit => 4096
    add_column :gitlab_tracking_commits, :state, :string, :limit => 200
    add_column :gitlab_tracking_commits, :merge_status, :string, :limit => 200
    add_column :gitlab_tracking_commits, :source_branch, :string, :limit => 1000
    add_column :gitlab_tracking_commits, :target_branch, :string, :limit => 1000
    add_column :gitlab_tracking_commits, :last_edited_at, :timestamp
  end
end