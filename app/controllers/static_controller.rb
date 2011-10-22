class StaticController < ApplicationController

  def home
    if current_user
      #checkin
      current_user.update_attribute :last_active, Time.now
      
      #get all active
      @user_ids = User.active_ids
      
      render "static/home.html.erb"
    end
  end

end
