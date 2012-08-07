class Admin::LeaveApplicationsController < Admin::BaseController

  def index
    @leave_applications = LeaveApplication.where("state='approved'")
  end
end
