class ItemDonation < ApplicationRecord
  belongs_to :donatable, :polymorphic => true
  belongs_to :created_by, class_name: 'User'
  belongs_to :status_updated_by, class_name: 'User'
  belongs_to :period
  has_many :contributions
end
