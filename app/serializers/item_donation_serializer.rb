class ItemDonationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mount, :month, :year
end
