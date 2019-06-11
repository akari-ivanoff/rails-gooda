class Talent < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :offers
end
