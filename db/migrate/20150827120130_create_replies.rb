class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :text
      t.integer :reply_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
