class AddLinkeableToEntitylinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :entity_links, :linkeable, polymorphic: true, null: false
  end
end
