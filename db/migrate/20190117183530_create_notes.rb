class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
