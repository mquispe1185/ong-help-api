class AddVideoUrlToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :video_url, :string
  end
end
