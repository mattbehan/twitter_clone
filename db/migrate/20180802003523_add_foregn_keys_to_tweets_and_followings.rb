class AddForegnKeysToTweetsAndFollowings < ActiveRecord::Migration[5.1]
  def change
  	# forgot to add foreign keys earlier
  	# As this is a twitter clone, it would scale better to maintain referential integrity here rather than at the model level with dependent destroy, however if this were a true new app I would go with dependent destroy at the model level

  	add_foreign_key :followings, :users, column: :followed_user_id, on_delete: :cascade
  	add_foreign_key :followings, :users, column: :following_user_id, on_delete: :cascade

  	add_foreign_key :tweets, :users, on_delete: :cascade
  end
end
