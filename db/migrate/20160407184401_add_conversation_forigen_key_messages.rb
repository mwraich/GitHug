class AddConversationForigenKeyMessages < ActiveRecord::Migration
  def change
    add_column :messages, :conversation_id, :integer, index: true
  end
end
