class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end	
  
  def self.active_ids
    User.where("'users'.'last_active' >= ?", Time.now - 10).map { |u| u.id }
  end
end
