class StaticController < ApplicationController

  def home
    render :action => "home.html.haml"
  end

end
