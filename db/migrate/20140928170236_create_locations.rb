class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.integer :bus_id

      t.timestamps
    end
  end
end
