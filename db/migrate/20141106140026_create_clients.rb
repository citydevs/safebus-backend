class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :email
      t.text :reg_id
      t.string :device

      t.timestamps
    end
    add_index :clients, :email, unique: true
  end
end
