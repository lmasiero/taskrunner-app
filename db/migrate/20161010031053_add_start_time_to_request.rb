class AddStartTimeToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :start_time, :datetime
    add_column :requests, :end_time, :datetime
  end
end
