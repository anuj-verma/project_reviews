# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  name           :string
#  url            :text
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < ApplicationRecord
  validates :name, :url, presence: true

  belongs_to :imageable, polymorphic: true
end
