class AddUniquenessToUsername < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :handle, unique: true
  end
end
