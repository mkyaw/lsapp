class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end
    
    def new
        @course = Course.new
    end
    
    def edit
        @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(course_params)
            redirect_to admin_courses_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def show
        @course = Course.find(params[:id])
    end
    
    def destroy
       @course = Course.find(params[:id])
       @course.destroy
       redirect_to admin_courses_path
    end
    
    private
    def course_params
        params.require(:course).permit(:title, :description)
    end
end
