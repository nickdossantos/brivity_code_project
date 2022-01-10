# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users
15.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Create Posts
25.times do
  post = Post.create(
    user_id: Author.all.sample.id,
    title: Faker::Movie.title,
    body: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false)
  )
  # Create Comments
  10.times do
    Comment.create(
      post_id: post.id,
      user_id: Author.all.sample.id,
      body: Faker::Movies::StarWars.quote
    )
  end
end
