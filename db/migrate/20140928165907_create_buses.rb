class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :placa
      t.integer :route_id
      t.string :name

      t.timestamps
    end
  end
end
