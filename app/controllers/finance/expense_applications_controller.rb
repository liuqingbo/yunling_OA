class Finance::ExpenseApplicationsController < Finance::BaseController
  def index
    @expense_applications = ExpenseApplication.all
  end
end
