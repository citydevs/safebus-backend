class AddHarrasmentTypeToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :harrasment_type, :integer
  end
end
