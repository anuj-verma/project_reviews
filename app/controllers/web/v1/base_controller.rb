module Web
  module V1
    class BaseController < ApplicationController
      before_action :authenticate!

      X_API_KEY = 'X-Api-Key'.freeze

      def authenticate!
        jwt_payload = AuthHandler.decode(request.headers[X_API_KEY])
        current_user(jwt_payload: jwt_payload)
      rescue JWT::ExpiredSignature
        render_unauthorized(error_message: I18n.t('api_key.expired'))
      rescue JWT::DecodeError
        render_unauthorized(error_message: I18n.t('api_key.invalid'))
      end

      def current_user(jwt_payload: nil)
        @current_user ||= begin
                            auth_token = jwt_payload ? jwt_payload[0]['auth_token'] : nil
                            User.where(auth_token: auth_token).first
                          end
      end

      def serialize_resource(resource, serializer)
        options = { each_serializer: serializer }
        ActiveModelSerializers::SerializableResource.new(resource, options).as_json
      end

      def render_unauthorized(error_message:)
        error_response(error_message: error_message, status_code: :unauthorized)
      end

      def success_response(data:, status_code:)
        render json: {
          data: data,
        },
        status: status_code
      end

      def error_response(error_message:, status_code:)
        render json: {
          errors: {
            message: error_message,
          }
        },
        status: status_code
      end

      def resource_error_response(errors:, error_message:, status_code:)
        render json: {
          errors: errors,
          message: error_message
        },
        status: status_code
      end
    end
  end
end

