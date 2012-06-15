module ApplicationTypeFinder
  def expense_applications
    where('type = ?', 'ExpenseApplication')
  end
  def item_applications
    where('type = ?', 'ItemApplication')
  end
  def leave_applications
    where('type = ?', 'LeaveApplication')
  end
end