class AddDefaultToBoockingsStatus < ActiveRecord::Migration[5.2]
  change_column_default :boockings, :status, from: nil, to: 'pending'
end
