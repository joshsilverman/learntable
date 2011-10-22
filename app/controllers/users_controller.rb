require 'pusher'

Pusher.app_id = '9963'
Pusher.key = '40efb27cae6cf315fd28'
Pusher.secret = '4afb53de5299584d36ac'

class UsersController < ApplicationController

  def ask
    questions = Question.all
    Pusher['ask_channel'].trigger('question', questions.first.name)
    # sleep 10
    # Pusher['ask_channel'].trigger('question', questions.last.name)
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

end
