class ChangePhoneToBeStringInOngs < ActiveRecord::Migration[6.1]
  def change
    change_column :ongs, :phone, :string
  end
end
