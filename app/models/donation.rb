class Donation < ApplicationRecord
  belongs_to :fixed_cost
  belongs_to :user
end
