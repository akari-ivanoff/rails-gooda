# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
meg = User.create(first_name: 'Meg',
                last_name: 'Griffin',
                location: 'Malmö',
                email: 'marge@griffin.com',
                password: '111111',
                bio: "has a hat")

marge = User.create(first_name: 'Marge',
                last_name: 'Simpson',
                location: 'Almhult',
                email: 'marge@simpson.com',
                password: '111111',
                bio: "very tidy")

homer = User.create(first_name: 'Homer',
                last_name: 'Simpson',
                location: 'Almhult',
                email: 'homer@simpson.com',
                password: '111111',
                bio: "can do anything but gets sleepy quite fast")

peter = User.create(first_name: 'Peter',
                last_name: 'Griffin',
                location: 'Malmö',
                email: 'peter@griffin.com',
                password: '111111',
                bio: "is not very competent")



talents = ['Cooking & Baking', 'Gardening & Plants', 'Pet sitting', 'Teach & learn', 'Repairs around the house', 'Parenting and Caretaking']
# ['Carpentry & Construction', 'Cleaning', 'Decoration', 'Deep Clean', 'Delivery', 'Electrician', 'Errands', 'Event Staffing', 'Executive Assistant', 'Furniture Assembly','IKEA Assembly', 'Laundry and Ironing', 'Lift & Shift Furniture', 'Minor Home Repairs', 'Mounting', 'Moving Help', 'Office Administration', 'Organization', 'Packing & Unpacking', 'Painting', 'Pet Sitting', 'Plumbing', 'Sewing', 'Shopping', 'Waiting in Line', 'Window Cleaning', 'Removal']
talentobjects =[]
talents.each do |talent|
  talentobjects << Talent.create(title: talent)
end
puts talentobjects[0].title
homerfirstoffer = Offer.create(volunteer: homer, comment: "Lorem ispum Lorem ispum Lorem", talent: talentobjects[0])
homersecondoffer = Offer.create(volunteer: homer, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[1])
homerthirdoffer = Offer.create(volunteer: homer, comment: "Lorem ispum Lorem ispum ", talent: talentobjects[2])

megfirstoffer = Offer.create(volunteer: meg, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[0])
megsecondoffer = Offer.create(volunteer: meg, comment: "Lorem ispum Lorem ispum Lorem ispum ispum", talent: talentobjects[1])
megthirdoffer = Offer.create(volunteer: meg, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[2])


margefirstoffer = Offer.create(volunteer: marge, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[0])
margesecondoffer = Offer.create(volunteer: marge, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[1])
margethirdoffer = Offer.create(volunteer: marge, comment: "Lorem ispum Lorem ispum ", talent: talentobjects[2])
margefourthoffer = Offer.create(volunteer: marge, comment: "Lorem ispum Lorem ispum Lorem ispum Lorem ispum Lorem ispum", talent: talentobjects[3])

Invitation.create(title:'mow lawn', description:'my lawn is full of long grass, i would like it to be shorter', host: peter, offer: homerfirstoffer)
Invitation.create(title: 'paint cat', description: 'my cat is too white', host: peter, offer: homersecondoffer)
Invitation.create(title: 'paint lawn', description: 'you know', host: peter, offer: megfirstoffer)
Invitation.create(title: 'mow cat', description: 'not that difficult', host: homer, offer: margefirstoffer)
Invitation.create(title: 'wait for cat', description: 'be patient', host: homer, offer: margesecondoffer)
Invitation.create(title: '', description: '', host: homer, offer: margethirdoffer)
Invitation.create(title: '', description: '', host: peter, offer: margefourthoffer)
