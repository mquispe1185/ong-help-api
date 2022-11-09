class AddPeriodToFixedCosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :fixed_costs, :period, null: false, foreign_key: true
  end
end
