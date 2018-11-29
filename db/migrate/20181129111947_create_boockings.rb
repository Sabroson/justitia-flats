class CreateBoockings < ActiveRecord::Migration[5.2]
  def change
    create_table :boockings do |t|
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
