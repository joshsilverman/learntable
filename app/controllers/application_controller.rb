class ApplicationController < ActionController::Base
    protect_from_forgery

    helper_method :current_user

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    before_filter :ensure_domain

    def ensure_domain 
      url = request.url
      if url.include?('learntable.com')
          redirect_to url.gsub('www.learntable.com', 'learntable.com')
      end
    end
end