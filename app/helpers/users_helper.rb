module UsersHelper
  def get_parent_name user
    return if not user.parent
    user.parent.real_name
  end
end
