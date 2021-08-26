class AddChargeableToFixedCosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :fixed_costs, :chargeable, polymorphic: true, index: true, null: false
  end
end
