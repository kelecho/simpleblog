class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    private
  
    def authenticate_user!
      return if user_signed_in?
  
      redirect_to new_session_path, alert: 'You must sign in first.'
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    helper_method :current_user
  
    def user_signed_in?
      current_user
    end
    helper_method :user_signed_in?
end
