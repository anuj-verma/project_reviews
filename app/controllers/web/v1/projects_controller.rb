module Web
  module V1
    class ProjectsController < Web::V1::BaseController
      PROJECT_SERIALIZER = Web::V1::ProjectSerializer

      def index
        projects = Project.all
        success_response(
          data: serialize_resource(projects, PROJECT_SERIALIZER),
          status_code: :ok
        )
      end
    end
  end
end
