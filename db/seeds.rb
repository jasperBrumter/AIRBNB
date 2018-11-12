puts "populating users......."
puts "populating boats......."
25.times do |i|
  user = User.new({
    name: Faker::Artist.name,
    email: Faker::Internet.email
  })

  boat = Boat.new({
    location: Faker::Nation.capital_city,
    name: Faker::FunnyName.two_word_name,
    price: rand(30..80),
    number_of_crew: rand(1..4),
  })
  boat.user = user

  user.save
  boat.save

  3.times do |variable|
    Review.create({
      boat_id: i,
      rating: rand(1..5),
      content: Faker::RickAndMorty.quote
    })
  end
end

puts "adding bookings......."
puts "and reviews......."
25.times do |i|
  Booking.new({
    checkin: Date.new(2018,11,16),
    checkout: Date.new(2018,12,rand(1..20)),
    boat_id: rand(1..25),
    user_id: rand(1..25)
  })
end
