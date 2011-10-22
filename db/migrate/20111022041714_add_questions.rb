class AddQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
        t.string :name
        t.string :answer
        t.string :first_wrong_answer
        t.string :second_wrong_answer
        t.string :third_wrong_answer
    end    
  end

  def down
    drop_table :questions
  end
end
