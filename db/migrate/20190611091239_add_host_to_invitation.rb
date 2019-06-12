class AddHostToInvitation < ActiveRecord::Migration[5.2]
  def change
    # Notice how the index is for :host but references offers
    add_reference :invitations, :host, index: true, foreign_key: {to_table: :users }
  end
end

