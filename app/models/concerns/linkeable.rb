module Linkeable
  extend ActiveSupport::Concern

  included do
    has_many :entity_links, :as => :linkeable
  end
end
