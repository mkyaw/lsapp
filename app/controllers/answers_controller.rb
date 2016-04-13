class AnswersController < ApplicationController
    def index
        @answer = Answer.first
    end
end
