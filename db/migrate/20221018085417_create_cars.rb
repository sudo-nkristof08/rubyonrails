class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :BHP
      t.integer :mileage
      t.integer :starting_price
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
