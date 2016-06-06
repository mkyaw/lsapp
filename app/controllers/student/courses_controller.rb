class Student::CoursesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @student_courses = current_user.courses
        @courses = Course.all
        @course = Course.new
        # @course = Course.find(params[:id])
        # @answers = @student_courses.answers.all
    end
    
    def new
        @course = params[:course][:course_id]
        @user = current_user
        @answer = Answer.new
        @courses = Course.all
    end
    
    def create
        @course = current_user.courses.create
        if @course.valid?
            redirect_to student_student_courses_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    # private
    # def course_params
    #     params.require(:course).permit(:title)
    # end
end
