class PromptMessagesController < ApplicationController
  def index
    @prompt_messages = current_user.send_messages.prompt_messages
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prompt_messages}
    end
  end
end
