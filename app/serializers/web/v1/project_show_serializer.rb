module Web
  module V1
    class ProjectShowSerializer < Web::V1::ProjectSerializer
      has_many :reviews, serializer: Web::V1::ReviewSerializer
      has_many :images, serializer: Web::V1::ImageSerializer
    end
  end
end
