module Web
  module V1
    class BaseController < ApplicationController
      def serialize_resource(resource, serializer)
        options = { each_serializer: serializer }
        ActiveModelSerializers::SerializableResource.new(resource, options).as_json
      end

      def success_response(data:, status_code:)
        render json: {
          data: data,
        },
        status: status_code
      end
    end
  end
end
