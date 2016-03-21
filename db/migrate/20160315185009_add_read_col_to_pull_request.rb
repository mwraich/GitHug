class AddReadColToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :read, :boolean, :default => false
  end
end
