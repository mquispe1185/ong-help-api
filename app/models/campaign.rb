class Campaign < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category

  validates :name, :description, :phone, :email, :video_url, presence: true, allow_blank: false

end
