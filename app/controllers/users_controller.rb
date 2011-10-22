require 'pusher'

Pusher.app_id = '9963'
Pusher.key = '40efb27cae6cf315fd28'
Pusher.secret = '4afb53de5299584d36ac'

class UsersController < ApplicationController

  def ask
    questions = Question.all
    question = questions[rand(questions.size)]
    Pusher['ask_channel'].trigger('question', question)
    # sleep 30
    # question = questions[rand(questions.size)]
    # Pusher['ask_channel'].trigger('question', question)
  end

  def answer
    if not current_user.points 
      points = params['points_inc'].to_i
    else
      points = params['points_inc'].to_i + current_user.points
    end
    current_user.update_attribute(:points, points)
    Pusher['answer_channel'].trigger('score', {:user_id => current_user.id, :points_inc => params['points_inc']})
    render :text => nil
  end
  
  def checkin
    current_user.update_attribute :last_active, Time.now
    render :json => User.active_ids
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
