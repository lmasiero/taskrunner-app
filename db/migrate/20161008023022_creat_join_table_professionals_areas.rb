class CreatJoinTableProfessionalsAreas < ActiveRecord::Migration[5.0]
  def change
    create_join_table :professionals, :areas do |t|
      t.index :professional_id
      t.index :area_id
    end
  end
end
