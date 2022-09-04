class Ong < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category
  belongs_to :status_updated_by, class_name: 'User'

  validates :name, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :phone, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :video_url, presence: true, on: :create
  # validates :street, presence: true, on: :create
  # validates :longitude, presence: true, on: :create
  # validates :latitude, presence: true, on: :create


end
