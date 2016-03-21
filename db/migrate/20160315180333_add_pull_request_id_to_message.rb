class AddPullRequestIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :pull_request_id, :integer
  end
end
