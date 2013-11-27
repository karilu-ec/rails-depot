class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  
  def authorize
    if User.count.zero?
      flash[:notice] = "Please create Admin User" 
      redirect_to new_user_path, notice: "Please create a user."
    else
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
  end
  
  
  
  protect_from_forgery with: :exception
end
