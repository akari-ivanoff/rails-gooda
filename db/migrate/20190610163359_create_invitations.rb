class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :title
      t.text :description
      t.string :status, :default => "pending"
      t.string :photo
      t.date :start_date
      t.date :end_date
      t.references :offer
      t.timestamps
    end
  end
end
