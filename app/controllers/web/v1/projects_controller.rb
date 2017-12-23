module Web
  module V1
    class ProjectsController < Web::V1::BaseController
      before_action :load_project, only: :show

      def index
        projects = Project.all
        success_response(
          data: serialize_resource(projects, Web::V1::ProjectSerializer),
          status_code: :ok
        )
      end

      def show
        success_response(
          data: serialize_resource(@project, Web::V1::ProjectShowSerializer),
          status_code: :ok
        )
      end

      private

      def load_project
        @project = Project.includes(:images, reviews: :user).where(id: params[:id]).first
        error_response(
          error_message: I18n.t('project.not_found'),
          status_code: :unprocessable_entity
        ) unless @project
      end
    end
  end
end
