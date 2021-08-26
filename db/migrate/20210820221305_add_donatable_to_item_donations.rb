class AddDonatableToItemDonations < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_donations, :donatable, polymorphic: true, index: true, null: false
  end
end
