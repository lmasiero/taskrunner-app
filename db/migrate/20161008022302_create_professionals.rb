class CreateProfessionals < ActiveRecord::Migration[5.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :category_id
      t.integer :mobile_number

      t.timestamps
    end
  end
end
