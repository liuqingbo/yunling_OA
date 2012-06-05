class LeaveApplicationsController < ApplicationController

  def index
    @leave_applications = current_user.send_applications.leave_applications
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leave_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @leave_application = LeaveApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leave_application }
    end
  end


  def create
    convert_receiver_ids_by_real_names("leave_application")

    @leave_application = LeaveApplication.new(params[:leave_application])
    @leave_application.sender = current_user

    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to(@leave_application, :notice => 'leave_application was successfully created.') }
        format.xml  { render :xml => @leave_application, :status => :created, :location => @leave_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @leave_application.errors, :status => :unprocessable_entity }
      end
    end

  end


end
