class AddStatusToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :status, :integer, default: 0
    add_index :messages, :status
  end
end
