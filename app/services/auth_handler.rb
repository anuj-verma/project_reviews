# Generates and Decodes JWT token from a given user's information
class AuthHandler

  JWT_ALGORITHM = 'HS256'.freeze

  # Method Signature
  # encode(payload, key, algorithm = 'HS256', header_fields = {})
  def self.encode(user)
    payload = { auth_token: user.auth_token }
    JWT.encode(payload, Rails.application.secrets.secret_key_base, JWT_ALGORITHM)
  end

  # Method Signature
  # decode(jwt, key = nil, verify = true, custom_options = {}, &keyfinder)
  def self.decode(api_key)
    JWT.decode(api_key, Rails.application.secrets.secret_key_base, true, { algorithm: JWT_ALGORITHM })
  end
end
