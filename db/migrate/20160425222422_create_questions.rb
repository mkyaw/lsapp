class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :course_id
      t.timestamps null: false
    end
    
    add_index :questions, :course_id
  end
end
