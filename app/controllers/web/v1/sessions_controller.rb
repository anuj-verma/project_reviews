module Web
  module V1
    class SessionsController < Web::V1::BaseController
      skip_before_action :authenticate!, only: :create

      def create
        user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
          success_response(
            data: serialize_resource(user, Web::V1::UserLoginSerializer),
            status_code: :ok
          )
        else
          error_response(
            error_message: I18n.t('user.invalid'),
            status_code: :unauthorized
          )
        end
      end

      private

      def session_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
