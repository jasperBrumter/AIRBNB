class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.float :price
      t.integer :number_of_crew
      t.float :average_rating

      t.timestamps
    end
  end
end
