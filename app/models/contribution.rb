class Contribution < ApplicationRecord
  belongs_to :item_donation
  belongs_to :user
  belongs_to :status_updated_by, class_name: 'User'
end
