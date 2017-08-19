require 'random_data'

#Create Users
5.times do
  User.create!(
  email: RandomData.random_email,
  password: RandomData.random_sentence,
  confirmed_at: DateTime.now
  )
end
users = User.all

#Create Topics
5.times do
  topic = Topic.create!(
    title: RandomData.random_word,
    user: users.sample
  )

  topic.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
topics = Topic.all

#Create Bookmarks
50.times do
  bookmark = Bookmark.create!(
  url: RandomData.random_url,
  topic: topics.sample
  )

  bookmark.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
