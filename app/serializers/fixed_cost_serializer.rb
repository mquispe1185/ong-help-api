class FixedCostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :mount, :period_id
  belongs_to :period
end
