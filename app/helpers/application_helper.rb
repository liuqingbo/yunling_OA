module ApplicationHelper
  def flash_messages
    flash.map do |name, message|
      content_tag :p, message, :class => [:notice, name].uniq.join(' ')
    end.join.html_safe if flash.present?
  end

  def logged_in?
    !!@current_user
  end

  def get_has_many_model_list_name(obj, attrs, name)
    str = ""
    obj.send(attrs.to_sym).each do |x|
      str += x.send(name.to_sym) + ";"
    end
    str
  end

  def get_state_of_message(message)
    state = ''
    if message.application_receivers.reject.size > 0
      state = I18n.t('views_application_receivers.rejected')
      message.application_receivers.reject.each do |msg|
        state += ' ' + I18n.t('views_application_receivers.reason') + ': ' + msg.reason + ' '
      end
    elsif message.application_receivers.pending.size > 0
      state = I18n.t('views_application_receivers.pending')
    else
      state = I18n.t('views_application_receivers.approved')
    end
    state
  end

end
