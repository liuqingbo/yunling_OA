class ExpenseApplication < Application
  USE = [
    I18n.t("init_data.expense_application.use.project"),
    I18n.t("init_data.expense_application.use.office"),
    I18n.t("init_data.application.use.other")
  ]
end