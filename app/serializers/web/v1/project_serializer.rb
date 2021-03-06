module Web
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :name, :address, :description, :no_of_units, :no_of_towers,
                 :status, :price_range, :banner_url

      def price_range
        "#{object.min_price} - #{object.max_price} #{object.price_metric}"
      end
    end
  end
end
