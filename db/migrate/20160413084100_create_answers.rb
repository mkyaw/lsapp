class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :course
      t.string :professor
      t.text :answer_one
      t.text :answer_two
      t.text :answer_three
      t.timestamps null: false
    end
  end
end
