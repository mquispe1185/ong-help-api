class AddUpdatedByToOngs < ActiveRecord::Migration[6.1]
  def change
    add_column :ongs, :updated_by_id, :integer
    add_foreign_key :ongs, :users, column: :updated_by_id, primary_key: :id
  end
end
