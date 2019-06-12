class AddSlugToTalents < ActiveRecord::Migration[5.2]
  def change
    add_column :talents, :slug, :string
  end
end
