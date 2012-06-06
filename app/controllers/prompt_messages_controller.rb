class PromptMessagesController < ApplicationController
  def index
    @prompt_messages = current_user.receive_messages.prompt_messages
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prompt_messages}
    end
  end

  def show
  	@prompt_message = PromptMessage.find(params[:id])
 	MessageReceiver.find_by_message_and_receiver(@prompt_message, current_user)
 	.first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prompt_message }
    end
  end

end
