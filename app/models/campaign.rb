class Campaign < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :phone, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :video_url, presence: true, on: :create

end
