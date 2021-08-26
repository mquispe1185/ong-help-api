class CreateOngs < ActiveRecord::Migration[6.1]
  def change
    create_table :ongs do |t|
      t.string :name
      t.string :description
      t.string :street
      t.references :city, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.integer :phone
      t.string :email
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :longitude
      t.string :latitude
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :tags
      t.references :status_updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_foreign_key :ongs, :users, column: :status_updated_by_id, primary_key: :id
  end
end
