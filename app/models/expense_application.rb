class ExpenseApplication < Application
  validates :reason, :presence => true
  validates :item_name, :presence => true
  validates :sum, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :use, :presence => true
  
  USE = [
    I18n.t("init_data.payment_application.use.cash"),
    I18n.t("init_data.payment_application.use.online_banking"),
    I18n.t("init_data.payment_application.use.check"),
    I18n.t("init_data.application.use.other")
  ]
end