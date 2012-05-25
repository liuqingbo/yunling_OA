class CommunicateMsgsController < ApplicationController

  def index
    if params[:flag] == "send"
      @communicate_msgs = current_user.send_messages
      @send = true
    elsif  params[:flag] == "receive"
      @communicate_msgs = current_user.receive_messages
      @send = false
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @communicate_msg = CommunicateMsg.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @communicate_msg }
    end
  end

  def show

  end

end
