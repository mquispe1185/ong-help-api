# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if User.count.zero?
  3.times do |i|
    User.create(email: "user#{i}@example.com",
                password: "user123",
                name: "User #{i}",
                image: "https://lh3.googleusercontent.com/example")
  end
end
if Province.count.zero?
  3.times do |i|
    Province.create(name: "Province #{i}")
  end
end
if City.count.zero?
  3.times do |i|
    City.create(name: "City #{i}", 
                province_id: i)
  end
end
if Category.count.zero?
  3.times do |i|
    Category.create(name: "Category #{i}")
  end
end
if Ong.count.zero?
  4.times do |i|
    Ong.create(name: "Ong #{i}",
               description: "This Ong description.",
               city_id: i,
               province_id: i,
               phone: 1111-2222-3333,
               email: "ong#{i}@example.com",
               user_id: i,
               category_id: i,
               status_updated_by_id: i,
               video_url: "http://example.com/")
  end
end
if Campaign.count.zero?
  4.times do |i|
    Campaign.create(name: "Campaign #{i}",
               description: "This Campaign description.",
               city_id: i,
               province_id: i,
               phone: 1111-2222-3333,
               email: "ong#{i}@example.com",
               user_id: i,
               category_id: i,
               status_updated_by_id: i,
               video_url: "http://example.com/")
  end
end
