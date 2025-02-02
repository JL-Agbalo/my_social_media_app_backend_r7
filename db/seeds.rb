# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create!([
  { username: "john_doe", email: "john@example.com", password: "password123", bio: "I love coding!", profile_picture: "https://example.com/john.jpg", first_name: "John", last_name: "Doe" },
  { username: "jane_doe", email: "jane@example.com", password: "securepass", bio: "Social media enthusiast", profile_picture: "https://example.com/jane.jpg", first_name: "Jane", last_name: "Doe" }
])

# https://chatgpt.com/share/679e3a8f-a390-8001-b0e7-0332e8353696