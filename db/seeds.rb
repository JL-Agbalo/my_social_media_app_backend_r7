# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create Users
user1 = User.create!(
  username: "john_doe",
  email: "john@example.com",
  password: "Password123!",
  first_name: "John",
  last_name: "Doe",
  bio: "I love coding!",
  profile_picture: "https://example.com/john.jpg"
)

user2 = User.create!(
  username: "jane_doe",
  email: "jane@example.com",
  password: "SecurePass123!",
  first_name: "Jane",
  last_name: "Doe",
  bio: "Social media enthusiast",
  profile_picture: "https://example.com/jane.jpg"
)

# Create Posts
# Post.create!(
#   content: "This is my first post!",
#   image_url: "https://example.com/post1.jpg",
#   user: user1
# )

# Post.create!(
#   content: "Enjoying the sunny weather!",
#   image_url: "https://example.com/post2.jpg",
#   user: user1
# )

# Post.create!(
#   content: "Just had a great lunch!",
#   image_url: "https://example.com/post3.jpg",
#   user: user2
# )

# Post.create!(
#   content: "Loving this new app!",
#   image_url: "https://example.com/post4.jpg",
#   user: user2
# )
# https://chatgpt.com/share/679e3a8f-a390-8001-b0e7-0332e8353696