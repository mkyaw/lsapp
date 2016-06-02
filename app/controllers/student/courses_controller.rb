class Student::CoursesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @courses = current_user.courses
    end
end
