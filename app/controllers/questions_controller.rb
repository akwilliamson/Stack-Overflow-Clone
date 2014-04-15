class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.update(:user_id => current_user.id)
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
