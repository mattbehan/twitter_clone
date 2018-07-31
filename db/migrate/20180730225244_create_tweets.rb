class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
    	t.references :user, index: true, null: false
    	t.string :message, null: false
      t.timestamps
    end
  end
end
