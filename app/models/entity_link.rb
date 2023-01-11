class EntityLink < ApplicationRecord
  belongs_to :linkeable, :polymorphic => true
end
