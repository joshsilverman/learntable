require 'pusher'

Pusher.app_id = '9963'
Pusher.key = '40efb27cae6cf315fd28'
Pusher.secret = '4afb53de5299584d36ac'

class StaticController < ApplicationController

  def home
    if current_user
      #checkin
      current_user.update_attribute :last_active, Time.now
      
      #get all active
      @user_ids = User.active_ids
    end
  end

end
