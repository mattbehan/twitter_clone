class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
    	t.integer :followed_user_id, index: true, null: false
    	t.integer :following_user_id, index: true, null: false
      t.timestamps
    end
  end
end
