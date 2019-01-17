

# Delete all previous data to clean the database
User.delete_all
Note.delete_all

# Generate Random Users using Faker gem
# 5.times do
#   User.create!(email: Faker::Internet.email,
#     password: Faker::Internet.password(8),
#     username: Faker::Name.name)
# end

# 5.times do
#     Note.create!(
#       title: Faker::Book.title,
#       content: Faker::SiliconValley.quote,
#       user: User.all.sample,
#       remote_photo_url: Faker::Placeholdit.image
#     )
# end

user_test = User.create!(email: Faker::Internet.email,
password: Faker::Internet.password(8),
username: Faker::Name.name)

url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
article = Note.new(title: 'NES', content: "A great console", user: user_test )
# sends photo to Cloudinary
article.remote_photo_url = url
article.save!


# 5.times do
#   end_user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
#   rand(5..10).times do
#     post = Post.new(name: Faker::Book.title, url: Faker::Internet.url, votes: rand(1..5))
#     post.user = end_user
#     post.save!
#   end
#   end_user.save!
# end