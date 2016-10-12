class AddColumnLastUpdate < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :last_updated_by, :string
  end
end
