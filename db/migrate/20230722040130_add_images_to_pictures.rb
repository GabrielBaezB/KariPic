class AddImagesToPictures < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :images, :json, default: []
  end
end
