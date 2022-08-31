class OngSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :video_url
end
