class AddBannerImageToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :banner_url, :text
  end
end
