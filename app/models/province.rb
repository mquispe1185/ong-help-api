class Province < ApplicationRecord
  has_many :cities
  has_many :ongs
  has_many :campaigns
  validates :name, presence: true, allow_blank: false
end
