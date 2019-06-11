# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_homer = User.create(first_name: 'Homer',
                last_name: 'Simpson',
                location: 'Almhult',
                email: 'homer@simpson.com',
                password: '111111',
                bio: "can do anything but gets sleepy quite fast")

user_peter = User.create(first_name: 'Peter',
                last_name: 'Griffin',
                location: 'Almhult',
                email: 'peter@griffin.com',
                password: '111111',
                bio: "is just plain annoying")

talents = ['Carpentry & Construction', 'Cleaning', 'Decoration', 'Deep Clean', 'Delivery', 'Electrician', 'Errands', 'Event Staffing', 'Executive Assistant', 'Furniture Assembly','IKEA Assembly', 'Laundry and Ironing', 'Lift & Shift Furniture', 'Minor Home Repairs', 'Mounting', 'Moving Help', 'Office Administration', 'Organization', 'Packing & Unpacking', 'Painting', 'Pet Sitting', 'Plumbing', 'Sewing', 'Shopping', 'Waiting in Line', 'Window Cleaning', 'Removal']
talents.each do |talent|
  Talent.create(title: talent)

newoffer = Offer.create(volunteer:user_homer, talent:Talent.last)


end
#once we have the references: Offer.create([{

