class AddVolunteerToOffer < ActiveRecord::Migration[5.2]
  def change
    # Notice how the index is for :volunteer but references users
    add_reference :offers, :volunteer, index: true, foreign_key: {to_table: :users }
  end
end

