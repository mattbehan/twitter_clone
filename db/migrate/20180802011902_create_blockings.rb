class CreateBlockings < ActiveRecord::Migration[5.1]
  def change
    create_table :blockings do |t|
    	t.references :user, index: true, foreign_key: true, null: false, on_delete: :cascade
    	t.integer :blocked_user_id, index: true, null: false
      t.timestamps
    end
  end
end

