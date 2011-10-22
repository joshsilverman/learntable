class StaticController < ApplicationController

  def home
    current_user = true
    if current_user
      render 'static/room'
    else
      render 'static/home'
    end
  end
end
