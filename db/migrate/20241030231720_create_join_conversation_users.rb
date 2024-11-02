class CreateJoinConversationUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :conversations_users, id: :uuid do |t|
      t.references :conversation, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :conversations_users, [:conversation_id, :user_id]
  end
end
