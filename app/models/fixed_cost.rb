class FixedCost < ApplicationRecord
  belongs_to :chargeable, :polymorphic => true
  belongs_to :created_by, class_name: 'User'
  belongs_to :status_updated_by, class_name: 'User'
  belongs_to :period
  has_many :donations
end
