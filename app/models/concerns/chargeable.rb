module Chargeable
  extend ActiveSupport::Concern

  included do
    has_many :fixed_costs, :as => :chargeable
  end
end