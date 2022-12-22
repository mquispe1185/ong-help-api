class FullOngSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :category_id, :city_id, :facebook, :instagram, :twitter, :video_url, :description, :tags
  belongs_to :category
  belongs_to :city

  # for develop ENV
  attribute :photos do
    object.photos.map{|p| [p.id, ActiveStorage::Blob.service.path_for(p.key).split('src')[1]]}
  end
end
