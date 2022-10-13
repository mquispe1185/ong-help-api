class FullOngSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :category_id, :city_id, :facebook, :instagram, :twitter, :video_url, :description, :tags
  belongs_to :category
  belongs_to :city
end
