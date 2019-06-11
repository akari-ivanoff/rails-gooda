class Offer < ApplicationRecord
  # Sets the specific name of the foreign key to the volunteer_id like in the
  # migration above

  belongs_to :volunteer, class_name: :User, foreign_key: :volunteer_id
  belongs_to :talent
  # we can now create Offer.create(volunteer: "")
  has_many :invitations
end
