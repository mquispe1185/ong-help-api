class Ong < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category
  belongs_to :status_updated_by, class_name: 'User'

  validates_presence_of :name, :city_id, :province_id, :user_id
end
