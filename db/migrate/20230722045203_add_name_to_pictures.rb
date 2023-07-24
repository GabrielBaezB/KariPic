class AddNameToPictures < ActiveRecord::Migration[7.0]
  def change
    add_column :pictures, :name, :string
  end
end
