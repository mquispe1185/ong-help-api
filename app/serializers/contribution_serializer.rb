class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :mount, :status, :code, :created_at
  has_one :item_donation
  has_one :user
  has_one :status_updated_by

  attribute :entity_name do
    "#{object.item_donation.donatable_type}: #{object.item_donation.donatable.name}"
  end
end
