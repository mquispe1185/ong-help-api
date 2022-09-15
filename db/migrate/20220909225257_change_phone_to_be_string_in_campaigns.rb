class ChangePhoneToBeStringInCampaigns < ActiveRecord::Migration[6.1]
  def change
    change_column :campaigns, :phone, :string
  end
end
