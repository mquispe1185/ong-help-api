class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.references :fixed_cost, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :mount, default: 0
      t.integer :status, default: 0
      t.integer :way_to_pay, default: 0
      t.string :code
      t.integer :payment_id
      t.references :status_updated_by

      t.timestamps
    end
    add_foreign_key :donations, :users, column: :status_updated_by_id, primary_key: :id
  end
end
