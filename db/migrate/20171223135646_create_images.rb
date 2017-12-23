class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.text :url
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
