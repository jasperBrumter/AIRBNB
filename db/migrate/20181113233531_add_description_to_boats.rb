class AddDescriptionToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :description, :text
  end
end
