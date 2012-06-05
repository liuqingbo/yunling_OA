class ApplicationReceiversController < ApplicationController

  def index
    @application_receivers = current_user.application_receivers
  end
end
