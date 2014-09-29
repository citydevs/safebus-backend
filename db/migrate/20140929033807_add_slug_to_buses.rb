class AddSlugToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :slug, :string
    add_index :buses, :slug, unique: true
    add_index :buses, :placa, unique: true
  end
end
