class Campaign < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category
  belongs_to :status_updated_by, class_name: 'User', optional: true
  belongs_to :updated_by, class_name: 'User'

  validates :name, :description, :phone, :email, :video_url, presence: true, allow_blank: false

end
