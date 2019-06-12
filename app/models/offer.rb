class Offer < ApplicationRecord
  include PgSearch
  # Sets the specific name of the foreign key to the volunteer_id like in the
  belongs_to :volunteer, class_name: :User, foreign_key: :volunteer_id
  belongs_to :talent
  has_many :invitations
  validates :talent, uniqueness: { scope: :volunteer }

  pg_search_scope :global_search,
    against: [:comment],
    associated_against: {
      talent: [:title],
      volunteer: [:first_name, :last_name]
    },
    using: {
      tsearch: {prefix: true}
    }
end
