class PaymentApplication < Application
  validates :receive_payment_company, :presence => true
  validates :sum, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :use, :presence => true
  validates :reason, :presence => true

  USE = [
    I18n.t("init_data.expense_application.use.project"),
    I18n.t("init_data.expense_application.use.office"),
    I18n.t("init_data.expense_application.use.business_affair"),
    I18n.t("init_data.application.use.other")
  ]
end