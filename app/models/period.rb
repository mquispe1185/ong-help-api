class Period < ApplicationRecord
  has_many :fixed_costs
  has_many :item_donations
end
