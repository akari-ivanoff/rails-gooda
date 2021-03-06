# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all
# Talent.delete_all
# Offer.delete_all
# Invitation.delete_all

User.destroy_all
Talent.destroy_all
Offer.destroy_all
Invitation.destroy_all

puts 'Creating users...'

users_attributes = [
  {
    first_name: 'Meg',
    last_name: 'Griffin',
    location: 'Malmö',
    email: 'meg@griffin.com',
    password: '111111',
    bio: "Has a hat",
    photo: "meg.jpg"
  },
  {
    first_name: 'Marge',
    last_name: 'Simpson',
    location: 'Almhult',
    email: 'marge@simpson.com',
    password: '111111',
    bio: "Very tidy",
    photo: "marge.jpg"
  },
  {
    first_name: 'Homer',
    last_name: 'Simpson',
    location: 'Almhult',
    email: 'homer@simpson.com',
    password: '111111',
    bio: "Can do anything but gets sleepy quite fast",
    photo: "homer.jpg"
  },
  {
    first_name: 'Peter',
    last_name: 'Griffin',
    location: 'Malmö',
    email: 'peter@griffin.com',
    password: '111111',
    bio: "Is not very competent",
    photo: "peter.jpg"
  }
]

User.create!(users_attributes)
users = User.all
puts 'Users created!'

# talents = ['Carpentry & Construction', 'Cleaning', 'Decoration', 'Deep Clean', 'Delivery', 'Electrician', 'Errands', 'Event Staffing', 'Executive Assistant', 'Furniture Assembly','IKEA Assembly', 'Laundry and Ironing', 'Lift & Shift Furniture', 'Minor Home Repairs', 'Mounting', 'Moving Help', 'Office Administration', 'Organization', 'Packing & Unpacking', 'Painting', 'Pet Sitting', 'Plumbing', 'Sewing', 'Shopping', 'Waiting in Line', 'Window Cleaning', 'Removal']

puts 'Creating talents...'

talents_attributes = [
  {
    title: 'Cooking & Baking',
    photo: 'cooking-baking.jpg',
    slug: "cooking"
  },
  {
    title: 'Gardening & Plants',
    photo: 'gardening.jpg',
    slug: "gardening"
  },
  {
    title: 'Pet sitting',
    photo: 'pets.jpg',
    slug: "pets"
  },
  {
    title: 'Teach & learn',
    photo: 'teaching.jpg',
    slug: "teaching"
  },
  {
    title: 'Repairs around the house',
    photo: 'repairs.jpg',
    slug: "repairs"
  },
  {
    title: 'Parenting and Caretaking',
    photo: 'kids.jpg',
    slug: "kids"
  }
]

Talent.create!(talents_attributes)
talents = Talent.all
puts 'Talents created!'

puts 'Creating offers...'

users.each do |user|
  user_talents = talents.sample(Random.new.rand(3..6))
  user_talents.each do |user_talent|
    title = Faker::GreekPhilosophers.quote
    comment = Faker::Hipster.sentence
    offer_attributes = [
      {
        volunteer: user,
        title: title,
        comment: comment,
        talent: user_talent
      }
    ]
    Offer.create!(offer_attributes)
  end
end

offers = Offer.all
puts 'Offers created!'

puts 'Creating invitations...'

offers.each do |offer|
  Random.new.rand(0..1).times do
    title = Faker::Quote.yoda
    description = Faker::Hacker.say_something_smart
    start_date = Faker::Date.between(Date.today, 1.week.from_now)
    end_date = Faker::Date.between(1.week.from_now, 2.week.from_now)
    host = users.sample
    until host != offer.volunteer do
      host = users.sample
    end
    invitation_attributes = [
      {
        title: title,
        description: description,
        host: host,
        offer: offer,
        start_date: start_date,
        end_date: end_date
      }
    ]
    Invitation.create!(invitation_attributes)
  end
end

puts 'Invitations created!'
