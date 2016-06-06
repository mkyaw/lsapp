class AddCourseIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :course_id, :string
    add_index :answers, :course_id
  end
end
