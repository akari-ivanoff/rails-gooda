class CreateTalents < ActiveRecord::Migration[5.2]
  def change
    create_table :talents do |t|
      t.string :title
      t.string :photo
      t.references
      t.timestamps
    end
  end
end
