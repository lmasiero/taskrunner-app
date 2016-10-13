class CreateBlockTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :block_times do |t|
      t.date :block_date

      t.timestamps
    end
  end
end
