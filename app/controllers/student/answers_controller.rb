class Student::AnswersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @student_courses = current_user.courses
        @courses = Course.all
        @course = Course.new
        @answers = @user.answers
    end
    
    def new
        @answer = Answer.new
    end
    
    def create
        @user = current_user
        @answer = @current_user.answers.create(answer_params)
        if @answer.valid?
            redirect_to student_student_answers_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @answer = Answer.find(params[:id])
    end
    
    def update
        @answer = Answer.find(params[:id])
        if @answer.update_attributes(answer_params)
            redirect_to student_student_answers_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @answer = Answer.find(params[:id])
        @answer.destroy
        redirect_to student_student_answers_path
    end
    
    def answer_params
        params.require(:answer).permit(:answer_one, :answer_two, :answer_three, :course_id, :user_id)
    end
end
