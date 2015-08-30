class RemoveLanguageFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :language, :string
    remove_column :tweets, :text, :string
  end
end
