class AddBestAnswerIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :best_answer_id,  :integer, default: nil
  end
end
