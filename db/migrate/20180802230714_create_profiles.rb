class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
    	t.references :user, index: true, foreign_key: true, on_delete: :cascade
    	t.attachment :picture
    	t.text :bio
    	t.string :location
    	t.string :website
    	t.date :birthday
      t.timestamps
    end
  end
end
