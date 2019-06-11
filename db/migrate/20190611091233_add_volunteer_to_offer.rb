class AddVolunteerToOffer < ActiveRecord::Migration[5.2]
  def change
    # Notice how the index is for :volunteer but references users
    add_reference :offers, :volunteer, references: :users, index: true

    # Just like the belongs_to contained class_name: :User, the foreign key
    # also needs a specific custom column name as :volunteer_id
    add_foreign_key :offers, :users, column: :volunteer_id
  end
end

