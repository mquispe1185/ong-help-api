class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :mount, :status, :code
  has_one :item_donation
  has_one :user
  has_one :status_updated_by
end
