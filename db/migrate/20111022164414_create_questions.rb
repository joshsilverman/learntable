class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :answer
      t.string :first_wrong_answer
      t.string :second_wrong_answer
      t.string :third_wrong_answer
      t.timestamps
    end
  end
end
