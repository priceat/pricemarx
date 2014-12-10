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

# seed hashtags
#tag_list = ['test', 'culture', 'sports', 'politics', 'fun']
#tag_list.each do |tag|
 # ActsAsTaggableOn::Tag.new(:name => tag).save
#end

# seed bookmarks
50.times do
Pricemark.create!(
    user: users.sample,
    url: Faker::Internet.url
  )
pricemarks = Pricemark.all
  pricemarks.each do |pricemark|
    pricemark.tag_list.add 'test', 'culture', 'sports', 'politics', 'fun'
    pricemark.save
  end
end



# like bookmarks
#100.times do
 # user = users.sample
  #Favorite.create!(
   # user: user,
    #bookmark: bookmarks.where('user_id != ?', user.id).sample
 # )
#end

puts "Seed finished."
puts "#{User.count} users created."
puts "#{Pricemark.count} pricemarx created."