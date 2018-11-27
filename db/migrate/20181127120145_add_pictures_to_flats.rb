class AddPicturesToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :picture, :string
  end
end
