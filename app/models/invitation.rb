class Invitation < ApplicationRecord
  validates :offer, uniqueness: { scope: :host }
  belongs_to :host, class_name: :User, foreign_key: :host_id
  belongs_to :offer
end
