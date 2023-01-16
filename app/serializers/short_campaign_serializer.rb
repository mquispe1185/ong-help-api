class ShortCampaignSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :type do
    object.class.name
    end
end
