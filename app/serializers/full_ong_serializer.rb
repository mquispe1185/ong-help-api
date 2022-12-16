class FullOngSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :category_id, :city_id, :facebook, :instagram, :twitter, :video_url, :description, :tags
  belongs_to :category
  belongs_to :city

  attribute :photos do
    object.photos.map{|p| ActiveStorage::Blob.service.path_for(p.key)}
  end
end
