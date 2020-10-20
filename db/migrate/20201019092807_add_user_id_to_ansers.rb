class AddUserIdToAnsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :user, foreign_key: true
  end
end
