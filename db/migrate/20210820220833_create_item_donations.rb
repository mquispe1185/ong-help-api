class CreateItemDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :item_donations do |t|
      t.string :title
      t.string :description
      t.integer :mount, default: 0
      t.integer :balance, default: 0
      t.integer :raised, default: 0
      t.references :created_by
      t.integer :month
      t.integer :year
      t.integer :status, default: 0
      t.references :status_updated_by

      t.timestamps
    end
    add_foreign_key :item_donations, :users, column: :created_by_id, primary_key: :id
    add_foreign_key :item_donations, :users, column: :status_updated_by_id, primary_key: :id
  end
end
