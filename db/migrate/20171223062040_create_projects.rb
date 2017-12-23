class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :no_of_units
      t.integer :no_of_towers
      t.string :status
      t.decimal :min_price
      t.decimal :max_price
      t.string :price_metric
      t.json :amenities

      t.timestamps
    end
  end
end
