class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :comment
      t.timestamps
      t.references :talent
    end
  end
end
