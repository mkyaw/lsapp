class Admin::QuestionsController < ApplicationController
    def new
        @course = Course.find(params[:course_id])
        @question = Question.new
    end
    
    def create
        @course = Course.find(params[:course_id])
        @question = @course.questions.create(question_params)
        redirect_to admin_course_path(@course)
    end
    
    private
    def question_params
        params.require(:question).permit(:title)
    end
end
