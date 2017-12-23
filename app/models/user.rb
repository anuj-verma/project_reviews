# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :reviews

  validates :name, :email, presence: true
  validates :email, format: {
    with: EMAIL_REGEX,
    message: I18n.t('user.email.invalid_format')
  }

  before_create :generate_and_set_auth_token

  private

  def generate_and_set_auth_token
    loop do
      self.auth_token = SecureRandom.base64.tr('0+/=', 'GOMT')
      break unless User.exists?(auth_token: auth_token)
    end
  end

  def api_key
    AuthHandler.encode(self)
  end
end
