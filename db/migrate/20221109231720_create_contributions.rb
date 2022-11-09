class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.references :item_donation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :mount
      t.integer :status
      t.string :code
      t.references :status_updated_by

      t.timestamps
    end
    add_foreign_key :contributions, :users, column: :status_updated_by_id, primary_key: :id
  end
end
