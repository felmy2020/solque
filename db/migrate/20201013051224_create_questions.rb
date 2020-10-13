class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
