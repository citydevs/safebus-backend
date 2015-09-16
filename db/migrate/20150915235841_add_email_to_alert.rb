class AddEmailToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :email, :string
  end
end
