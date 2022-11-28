# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if User.count.zero?
  3.times do |i|
    User.create(email: "user#{i+1}@example.com",
                password: "user123",
                name: "User #{i+1}",
                image: "https://lh3.googleusercontent.com/example")
  end
end
if Province.count.zero?
  3.times do |i|
    Province.create(name: "Province #{i+1}")
  end
end
if City.count.zero?
  3.times do |i|
    City.create(name: "City #{i+1}", 
                province_id: i+1)
  end
end
if Category.count.zero?
  3.times do |i|
    Category.create(name: "Category #{i+1}")
  end
end
if Ong.count.zero?
  3.times do |i|
    Ong.create(name: "Ong #{i+1}",
               description: "This Ong description.",
               city_id: i+1,
               province_id: i+1,
               phone: 1111-2222-3333,
               email: "ong#{i+1}@example.com",
               user_id: i+1,
               category_id: i+1,
               status_updated_by_id: i+1,
               video_url: "http://example.com/",
               updated_by_id: i+1)
  end
end
if Campaign.count.zero?
  3.times do |i|
    Campaign.create(name: "Campaign #{i+1}",
               description: "This Campaign description.",
               city_id: i+1,
               province_id: i+1,
               phone: 1111-2222-3333,
               email: "ong#{i+1}@example.com",
               user_id: i+1,
               category_id: i+1,
               status_updated_by_id: i+1,
               video_url: "http://example.com/",
               updated_by_id: i+1)
  end
end
if FixedCost.count.zero?
  3.times do |i|
    FixedCost.create(title: "Fixed Cost #{i+1}",
                description: "This Fixed Cost description.",
                mount: 50,
                created_by_id: i+1,
                status_updated_by_id: i+1,
                chargeable_type: "Ong",
                chargeable_id: i+1)
    Donation.create(fixed_cost_id: i+1,
                user_id: i+1,
                mount: 50)
  end
  3.times do |i|
    FixedCost.create(title: "Fixed Cost #{i+1}",
                description: "This Fixed Cost description.",
                mount: 50,
                created_by_id: i+1,
                status_updated_by_id: i+1,
                chargeable_type: "Campaign",
                chargeable_id: i+1)
    Donation.create(fixed_cost_id: i+4,
                user_id: i+1,
                mount: 50)
  end
end
if ItemDonation.count.zero?
  3.times do |i|
    ItemDonation.create(title: "Item Donation #{i+1}",
                description: "This Item Donation description.",
                mount: 50,
                created_by_id: i+1,
                status_updated_by_id: i+1,
                donatable_type: "Ong",
                donatable_id: i+1)
  end
  3.times do |i|
    ItemDonation.create(title: "Item Donation #{i+1}",
                description: "This Item Donation description.",
                mount: 50,
                created_by_id: i+1,
                status_updated_by_id: i+1,
                donatable_type: "Campaign",
                donatable_id: i+1)
  end
end

if Period.count.zero?
  Period.create(month: 11, year: 2022)
end
