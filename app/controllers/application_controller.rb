class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :current_user
  before_filter :check_authorization

  helper_method :current_user
  protect_from_forgery

  protected
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => I18n.t("login.login_prompt")
      end
    end

    def check_authorization
      unless current_user && current_user.can?(action_name, controller_name)
        redirect_to root_path,
                      :notice=>I18n.t("error.permit_deny")
      end
    end

    def convert_receiver_ids_by_real_names(arg_name)
      user_ids = User.find_ids_by_real_names(params[arg_name][:receiver_ids].split(";"))
      params[arg_name][:receiver_ids] = user_ids
    end
  
end
