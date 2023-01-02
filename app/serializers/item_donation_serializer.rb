class ItemDonationSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mount, :raised, :period_id
  belongs_to :period
  attribute :editable do 
  	object.contributions.count == 0
  end
end
