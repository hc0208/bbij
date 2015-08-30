class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.text :language

      t.timestamps null: false
    end
  end
end
