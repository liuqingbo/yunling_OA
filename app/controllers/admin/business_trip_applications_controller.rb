class Admin::BusinessTripApplicationsController < Admin::BaseController

  def index
    @business_trip_applications = BusinessTripApplication.where("state='approved'")
  end

  def show
    @business_trip_application = BusinessTripApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_trip_application }
    end
  end
end
