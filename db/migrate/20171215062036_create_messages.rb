class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subject, null: false, default: ''
      t.text :body, null: false, default: ''
      t.references :receiver, foreign_key: { to_table: :users }
      t.references :sender, foreign_key: { to_table: :users }
      t.timestamp :read_at
      t.timestamp :archived_at

      t.timestamps
    end

    add_index :messages, [:receiver_id, :sender_id]
  end
end
