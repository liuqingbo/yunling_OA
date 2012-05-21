module ApplicationHelper
  def flash_messages
    flash.map do |name, message|
      content_tag :p, message, :class => [:notice, name].uniq.join(' ')
    end.join.html_safe if flash.present?
  end

  def logged_in?
    !!@current_user
  end

  def current_user
    @current_user
  end
end
