class AddTextToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :text, :text
    add_column :tweets, :language, :integer
  end
end
