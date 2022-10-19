class DonationSerializer < ActiveModel::Serializer
  attributes :id, :fixed_cost_id, :user_id, :mount
  belongs_to :fixed_cost
  belongs_to :user
end
