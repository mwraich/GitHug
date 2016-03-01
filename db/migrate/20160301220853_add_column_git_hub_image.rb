class AddColumnGitHubImage < ActiveRecord::Migration
  def change
    add_column :users, :github_image, :string
  end
end
