class CreateJoinTableServicesProfessionals < ActiveRecord::Migration[5.0]
  def change
    create_join_table :professionals, :services do |t|
      t.index :professional_id
      t.index :service_id
    end
  end
end
