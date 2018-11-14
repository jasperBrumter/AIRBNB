puts "cleaning databse......."
Review.destroy_all
Booking.destroy_all
Boat.destroy_all
User.destroy_all


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

  3.times do
    Review.create({
      boat_id: Boat.first.id+(i-1),
      rating: rand(1..5),
      content: Faker::RickAndMorty.quote
    })
  end
end

puts "creating test-user:"
puts "email: a@a.ca"
puts "password: 123456"

bob = User.new({
  email: "a@a.ca",
  password: "123456",
  name: "bob"
})
bob.save

boat = Boat.new({
  address: Faker::Nation.capital_city,
  name: Faker::FunnyName.two_word_name,
  price: rand(30..80),
  number_of_crew: rand(1..4),
  description: Faker::DrWho.quote
})
boat.user = bob
boat.save!


25.times do |iterator|
  booking = Booking.new({
    checkin: Date.new(2018,11,11),
    checkout: Date.new(2018,12,rand(1..20)),
    boat_id: Boat.first.id + (iterator -1)
  })
  booking.user = bob

  booking.save

end

#hi man
