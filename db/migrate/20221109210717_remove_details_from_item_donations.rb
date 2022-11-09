class RemoveDetailsFromItemDonations < ActiveRecord::Migration[6.1]
  def change
    remove_column :item_donations, :month, :integer
    remove_column :item_donations, :year, :integer
  end
end
