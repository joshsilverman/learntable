class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user

  before_filter :ensure_domain
  
	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end



  def ensure_domain 
    url = request.url
    if url.include?('www.learntable.com')
        redirect_to url.gsup('www.learntable.com', 'learntable.com')
    end 
  end
  
end
