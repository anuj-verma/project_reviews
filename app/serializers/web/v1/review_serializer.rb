module Web
  module V1
    class ReviewSerializer < ActiveModel::Serializer
      attributes :id, :rating, :description, :user

      def user
        Web::V1::UserSerializer.new(object.user)
      end
    end
  end
end
