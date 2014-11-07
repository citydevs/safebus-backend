class AddDeviceToBus < ActiveRecord::Migration
  def change
    add_column :buses, :device, :string
    add_column :buses, :reg_id, :text
  end
end
