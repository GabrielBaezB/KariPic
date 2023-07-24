class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :url
      t.string :context
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
