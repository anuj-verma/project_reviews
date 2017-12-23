class AddProjectToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :project, foreign_key: true
  end
end
