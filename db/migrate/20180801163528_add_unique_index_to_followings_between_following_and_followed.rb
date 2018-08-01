class AddUniqueIndexToFollowingsBetweenFollowingAndFollowed < ActiveRecord::Migration[5.1]
  def change
  	add_index :followings, [:followed_user_id, :following_user_id], unique: true
  end
end
