class FixedCostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mount, :period_id
  belongs_to :period
  attribute :editable do 
  	object.donations.count == 0
  end
end
