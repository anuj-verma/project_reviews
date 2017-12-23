module Web
  module V1
    class ReviewsController < Web::V1::BaseController
      before_action :load_project, only: :create

      def create
        review = @project.reviews.new(review_params)
        if review.save
          review = serialize_resource(review, Web::V1::ReviewSerializer)
          success_response(data: review, status_code: :ok)
        else
          resource_error_response(
            errors: review.errors,
            error_message: I18n.t('review.invalid'),
            status_code: :unprocessable_entity
          )
        end
      end

      private

      def review_params
        params.require(:review).permit(:rating, :description, :user_id)
      end

      def load_project
        @project = Project.where(id: params[:project_id]).first
        error_response(
          error_message: I18n.t('project.not_found'),
          status_code: :unprocessable_entity
        ) unless @project
      end
    end
  end
end
