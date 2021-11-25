module Donatable
  extend ActiveSupport::Concern

  included do
    has_many :item_donations, :as => :donatable
  end
end