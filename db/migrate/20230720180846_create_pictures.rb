class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :caption
      t.string :feelings
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
