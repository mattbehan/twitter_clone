class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :name, :string, null: false
	add_column :users, :handle, :string, null: false
  end
end
