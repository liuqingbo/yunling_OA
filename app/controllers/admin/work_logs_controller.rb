class Admin::WorkLogsController < Admin::BaseController

  def index
    @work_logs = WorkLog.all.paginate(:page => params[:page]).order('id DESC')
  end

end