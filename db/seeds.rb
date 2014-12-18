require 'faker'

User.destroy_all
Pricemark.destroy_all

# seed users
5.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'helloworld'
  )
end
users = User.all

tags = %w(sports politics fun girls news)

# seed bookmarks
50.times do
Pricemark.create!(
    user: users.sample,
    url: Faker::Internet.url,
    title: Faker::Lorem.word,
    tag_list: tags.sample(rand(1..5))
  )
end


puts "Seed finished."
puts "#{User.count} users created."
puts "#{Pricemark.count} pricemarx created."