class Admin::CoursesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @courses = Course.all
        # @products = @products.status(params[:status]) if params[:status].present?
        @students = User.all
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = current_user.courses.create(course_params)
        if @course.valid?
            redirect_to admin_courses_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @course = Course.find(params[:id])
    end
    
    def edit
        @course = Course.find(params[:id])
        if @course.valid?
            redirect_to admin_courses_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    def course_params
        params.require(:course).permit(:title, :description)
    end
end
