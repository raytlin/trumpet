class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text "content"
      t.integer "user_id", :null => false
      t.timestamps
    end
  end
end
