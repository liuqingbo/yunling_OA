class UseCarRegistrationsController < ApplicationController

  def index
    @use_car_registrations = current_user.use_car_registrations
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @use_car_registration = UseCarRegistration.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def create
    @use_car_registration = UseCarRegistration.new(params[:use_car_registration])
    @use_car_registration.user = current_user

    respond_to do |format|
      if @use_car_registration.save
        format.html { redirect_to(@use_car_registration, :notice => 'use_car_registration was successfully created.') }
      else
        format.html { render "new" }
      end
    end

  end

  def show
    @use_car_registration = UseCarRegistration.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
