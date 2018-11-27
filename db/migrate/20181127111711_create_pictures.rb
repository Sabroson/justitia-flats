class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :flat, foreign_key: true
      t.string :url
      t.boolean :is_primary, default: false

      t.timestamps
    end
  end
end
