class AddUpdatedByToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :updated_by_id, :integer
    add_foreign_key :campaigns, :users, column: :updated_by_id, primary_key: :id
  end
end
