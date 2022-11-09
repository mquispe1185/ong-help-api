class RemoveDetailsFromFixedCosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :fixed_costs, :month, :integer
    remove_column :fixed_costs, :year, :integer
  end
end
