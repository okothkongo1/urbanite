class CreateAdvertisements < ActiveRecord::Migration[6.0]
  def change
    create_table :advertisements do |t|
      t.string :location
      t.string :category
      t.string :advert_type
      t.string :model
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
