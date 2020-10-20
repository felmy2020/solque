class AddReplyUserIdToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :reply_answer, :int
  end
end
