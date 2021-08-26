class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
