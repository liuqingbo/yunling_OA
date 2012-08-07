class Admin::WorkLogsController < Admin::BaseController

  def index
    @work_logs = WorkLog.all
  end

end