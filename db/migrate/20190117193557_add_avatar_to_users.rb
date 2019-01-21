class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, default: "https://res.cloudinary.com/dqiosiccn/image/upload/v1547946569/iqkmsrrrqjbaaqgkeotf.png"
  end
end
