class UpdateLanguageTable < ActiveRecord::Migration
  def change
    rename_column :languages, :profile_id, :languageable_id
    add_column :languages, :languageable_type, :string
  end
end
