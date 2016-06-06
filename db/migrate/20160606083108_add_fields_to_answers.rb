class AddFieldsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_one, :string
    add_column :answers, :answer_two, :string
    add_column :answers, :answer_three, :string
  end
end
