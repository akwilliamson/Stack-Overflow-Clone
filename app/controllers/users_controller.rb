class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Created'
      redirect_to root_url
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posted_questions = Question.where(:user_id => @user.id)
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
