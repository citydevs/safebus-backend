class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :type
      t.float :latitude
      t.float :longitude
      t.integer :client_id

      t.timestamps
    end
  end
end
