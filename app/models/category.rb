class Category < ApplicationRecord
  has_many :ongs
  has_many :campaigns
  validates :name, presence: true, allow_blank: false
end
