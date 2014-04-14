class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    else
      render 'users/show'
    end
  end

private
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
