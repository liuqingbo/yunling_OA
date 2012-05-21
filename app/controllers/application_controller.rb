class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :current_user
  before_filter :check_authorization
  protect_from_forgery

  protected
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

    def check_authorization
      if not current_user
        return true
      end
      unless current_user.can?(action_name, controller_name)
        redirect_to root_url,
                      :notice=>"sorry,您的权限不够, 不能访问该功能"
      end
    end
  
end
