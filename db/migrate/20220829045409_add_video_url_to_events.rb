class AddVideoUrlToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :video_url, :string
  end
end
