class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # We need to speciy what the foreign_key is for the opposite association
  # otherwise the User model won't know what column to join on in the SQL
  # statement.
  has_many :offers, foreign_key: :volunteer_id
end
