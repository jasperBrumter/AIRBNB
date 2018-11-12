class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :boat, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
