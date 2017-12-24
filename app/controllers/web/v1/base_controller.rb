module Web
  module V1
    class BaseController < ApplicationController
      before_action :authenticate!

      X_API_KEY = 'X-Api-Key'.freeze

      def authenticate!
        jwt_payload = AuthHandler.decode(request.headers[X_API_KEY])
        current_user(jwt_payload: jwt_payload)
      rescue JWT::DecodeError
        render_unauthorized(error_message: I18n.t('api_key.invalid'))
      end

      def current_user(jwt_payload: nil)
        @current_user ||= begin
          auth_token = jwt_payload ? jwt_payload[0]['auth_token'] : nil
          User.where(auth_token: auth_token).first
        end
      end
    end
  end
end

