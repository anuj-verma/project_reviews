# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  description  :text
#  no_of_units  :integer
#  no_of_towers :integer
#  status       :string
#  min_price    :integer
#  max_price    :integer
#  price_metric :string
#  amenities    :json             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  banner_url   :text
#

class Project < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :images, as: :imageable

  validates :name, :address, :description, :banner_url, presence: true
  validates :no_of_units, numericality: { only_integer: true, allow_nil: true }
  validates :no_of_towers, numericality: { only_integer: true, allow_nil: true }
  validate  :min_price_and_max_price

  private

  def min_price_and_max_price
    if min_price.to_f > max_price.to_f
      errors.add(:min_price, I18n.t('project.min_price.invalid'))
      errors.add(:max_price, I18n.t('project.max_price.invalid'))
    end
  end
end
