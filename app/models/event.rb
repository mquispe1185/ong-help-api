class Event < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :ong
  belongs_to :city
  belongs_to :province
  belongs_to :created_by
  belongs_to :status_updated_by, class_name: 'User'
end
