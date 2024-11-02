class CreateConversations < ActiveRecord::Migration[7.2]
  def change
    create_table :conversations, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
