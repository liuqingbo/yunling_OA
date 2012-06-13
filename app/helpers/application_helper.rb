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

  def get_application_detail_info application
    str = ""
    application.application_receivers.each do |a_receiver|
      str << a_receiver.receiver.real_name + " : " +I18n.t("activerecord.state.application.#{a_receiver.state}" + "<br/>")
      if a_receiver.rejected?
        str << "<div class='application_receiver_reason'>" + I18n.t("activerecord.attributes.application_receiver.reason") + " : "
        str << a_receiver.reason
        str << "</div>"
      end
    end
    str
  end

end
