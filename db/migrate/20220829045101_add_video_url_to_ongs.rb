class AddVideoUrlToOngs < ActiveRecord::Migration[6.1]
  def change
    add_column :ongs, :video_url, :string
  end
end
