class ChangeBoockingsToBookings < ActiveRecord::Migration[5.2]
  def change
    rename_table :boockings, :bookings
  end
end
