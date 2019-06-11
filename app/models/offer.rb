class Offer < ApplicationRecord
  # Sets the specific name of the foreign key to the volunteer_id like in the
  belongs_to :volunteer, class_name: :User, foreign_key: :volunteer_id
  belongs_to :talent
  has_many :invitations
  validates :talent, uniqueness: { scope: :volunteer }
end
