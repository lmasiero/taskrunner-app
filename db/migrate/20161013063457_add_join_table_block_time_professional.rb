class AddJoinTableBlockTimeProfessional < ActiveRecord::Migration[5.0]
  def change
    create_join_table :professionals, :block_times do |t|
      t.index :professional_id
      t.index :block_time_id
    end
  end
end
