class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :professional_id
      t.integer :user_id
      t.string :status
      t.string :appointment_time
      t.string :appointment_details

      t.timestamps
    end
  end
end
