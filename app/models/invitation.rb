class Invitation < ApplicationRecord
  belongs_to :host, class_name: :User, foreign_key: :host_id
  belongs_to :offer
end
