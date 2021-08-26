class Campaign < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category
end
