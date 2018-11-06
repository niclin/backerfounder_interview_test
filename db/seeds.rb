require "ruby-progressbar"

progress = ProgressBar.create(total: 100, format: "%e %B %p%% %c/%C")

puts "Create 100 users and posts"

100.times do
  user = User.create(email: Faker::Internet.email, password: "password")
  Post.create(title: Faker::Lorem.sentence(rand(2..10)).chomp('.'), link_url: Faker::Internet.url, user: user)
  progress.increment
end

puts "done."
