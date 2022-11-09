class ItemDonationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mount, :period_id
end
