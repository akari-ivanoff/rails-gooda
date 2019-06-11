class Invitation < ApplicationRecord
  validates :offer, presence: true, uniqueness: { scope: :host }
  validates :host_id, presence: true
  validates :title, presence: true
  belongs_to :host, class_name: :User, foreign_key: :host_id
  belongs_to :offer
end
