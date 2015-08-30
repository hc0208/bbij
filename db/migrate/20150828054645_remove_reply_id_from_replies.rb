class RemoveReplyIdFromReplies < ActiveRecord::Migration
  def change
    remove_column :replies, :reply_id, :integer
  end
end
