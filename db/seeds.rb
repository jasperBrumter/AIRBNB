puts "cleaning databse......."
Boat.destroy_all
User.destroy_all
Review.destroy_all
Booking.destroy_all
puts "populating users......."
puts "populating boats......."
puts "adding hilarious Reviews......"

25.times do |i|
  user = User.new({
    name: Faker::Artist.name,
    email: Faker::Internet.email,
    password: 'difficultpassword'
  })
  user.save!

  boat = Boat.new({
    address: Faker::Nation.capital_city,
    name: Faker::FunnyName.two_word_name,
    price: rand(30..80),
    number_of_crew: rand(1..4),
    description: Faker::DrWho.quote
  })
  boat.user = user


  boat.save!

  3.times do |variable|
    Review.create({
      boat_id: i,
      rating: rand(1..5),
      content: Faker::RickAndMorty.quote
    })
  end
end

puts "adding bookings......."
25.times do |i|
  Booking.new({
    checkin: Date.new(2018,11,16),
    checkout: Date.new(2018,12,rand(1..20)),
    boat_id: rand(1..25),
    user_id: rand(1..25)
  })
end
#hi man
