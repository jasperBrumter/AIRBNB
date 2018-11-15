class AddPhoto1ToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photo1, :string
  end
end
