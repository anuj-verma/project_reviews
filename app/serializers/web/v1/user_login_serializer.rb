module Web
  module V1
    class UserLoginSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :api_key

      def api_key
        AuthHandler.encode(object)
      end
    end
  end
end
