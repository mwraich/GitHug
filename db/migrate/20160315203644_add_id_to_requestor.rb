class AddIdToRequestor < ActiveRecord::Migration
  def change
    rename_column :pull_requests, :requestor, :requestor_id
    rename_column :pull_requests, :requestee, :requestee_id
  end
end
