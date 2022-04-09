class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  
  helper_method :current_user,
                :logged_in?
                :set_current_path
  
  private

  def authenticate_user!
   unless current_user
    set_current_path
    redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password pleases'
   end

    cookies[:email] = current_user&.email
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end  

  def logged_in?
    current_user.present?
  end

  def set_current_path
    session[:last_path] = request.url
  end  

end