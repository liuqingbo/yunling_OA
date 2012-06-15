class Finance::BaseController < ApplicationController
  before_filter :check_finance_or_not
  protected
    def check_finance_or_not
      p 'ddddddd'
      p Role::ROLES[:finance]
      p current_user.roles_name
      unless current_user && current_user.roles_name.include?(Role::ROLES[:finance])
        redirect_to root_path,
                      :notice=>I18n.t("error.permit_deny")
      end
    end
end