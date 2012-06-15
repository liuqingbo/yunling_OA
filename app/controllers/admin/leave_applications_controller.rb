class Admin::LeaveApplicationsController < Admin::BaseController

  def index
    @leave_applications = LeaveApplication.all
  end
end
