class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :photo, default: "https://res.cloudinary.com/dqiosiccn/image/upload/v1547997566/fdafs0ruf95mc03cmoxj.jpg"
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
