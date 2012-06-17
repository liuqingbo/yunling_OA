class LeaveApplication < Application
  USE = [
    I18n.t("init_data.leave_application.use.casual_leave"),
    I18n.t("init_data.leave_application.use.office_leave"),
    I18n.t("init_data.leave_application.use.sick_leave"),
    I18n.t("init_data.application.use.other")
  ]
end