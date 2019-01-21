class AddLocationToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :location, :string
  end
end
