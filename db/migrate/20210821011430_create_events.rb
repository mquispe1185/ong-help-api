class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :ong, null: false, foreign_key: true
      t.date :date
      t.string :hour
      t.string :title
      t.string :description
      t.references :city, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.integer :status
      t.references :created_by
      t.references :status_updated_by
      
      t.timestamps
    end
    add_foreign_key :events, :users, column: :created_by_id, primary_key: :id
    add_foreign_key :events, :users, column: :status_updated_by_id, primary_key: :id
  end
end
