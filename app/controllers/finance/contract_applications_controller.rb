class Finance::ContractApplicationsController < Finance::BaseController
  def index
    @contract_applications = ContractApplication.where("state='approved'")
  end

  def show
  	@contract_application = ContractApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract_application }
    end
  end
end