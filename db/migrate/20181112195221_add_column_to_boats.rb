class AddColumnToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :name, :string
  end
end
