module Web
  module V1
    class ImageSerializer < ActiveModel::Serializer
      attributes :id, :name, :url
    end
  end
end
