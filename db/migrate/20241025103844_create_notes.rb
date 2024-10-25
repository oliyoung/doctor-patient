class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes, id: :uuid do |t|
      t.references :appointment, null: false, foreign_key: true, type: :uuid
      t.string :kind
      t.text :body

      t.timestamps
    end
  end
end
