class Invitation < ApplicationRecord
  belongs_to :host, class_name: :User
  belongs_to :offer
  validates :offer, presence: true
  validates :host, presence: true
  validates :title, presence: true
  validates :status, inclusion: { in: %w(pending accepted declined closed), message: "%{value} is not a valid status"}
end
