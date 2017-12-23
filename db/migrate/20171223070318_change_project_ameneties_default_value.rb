class ChangeProjectAmenetiesDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :amenities, :json, default: {}, null: false
  end
end
