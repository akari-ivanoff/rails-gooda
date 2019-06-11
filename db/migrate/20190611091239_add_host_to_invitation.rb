class AddHostToInvitation < ActiveRecord::Migration[5.2]
  def change
    # Notice how the index is for :host but references offers
    add_reference :invitations, :host, references: :offers, index: true

    # Just like the belongs_to contained class_name: :Offer, the foreign key
    # also needs a specific custom column name as :host_id
    add_foreign_key :invitations, :offers, column: :host_id
  end
end

