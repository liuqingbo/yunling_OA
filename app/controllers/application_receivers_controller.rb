class ApplicationReceiversController < ApplicationController

  def index
    @application_receivers = current_user.application_receivers
  end

  def edit
    @application_receiver = ApplicationReceiver.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to(@notice, :notice => 'Notice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @application_receiver = ApplicationReceiver.find(params[:id])

    respond_to do |format|
      if @application_receiver.update_attributes(params[:application_receiver])
        format.html { redirect_to(@application_receiver, :notice => 'application_receiver was successfully update.') }
      else
        format.html { render :action => "edit" }
      end
    end


  end
end
