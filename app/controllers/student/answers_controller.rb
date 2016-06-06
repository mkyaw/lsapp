class Student::AnswersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @student_courses = current_user.courses
        @courses = Course.all
        @course = Course.new
        @answers = Answer.all
    end
    
    def new
        @answer = Answer.new
    end
    
    def create
        @user = current_user
        # @course = current_user.courses.create(course_params)
        @answer = @current_user.answers.create(answer_params)
        if @answer.valid?
            redirect_to student_student_answers_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @answer = @current_user.answers.find(params[:id])
    end
    
    def answer_params
        params.require(:answer).permit(:answer_one, :answer_two, :answer_three, :course_id, :user_id)
    end
end
