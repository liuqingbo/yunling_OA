module CommunicateMessagesHelper
  def generate_receiver_detail_info(message)
    result = ""
    message.message_receivers.each do |message_receiver|
      p     message_receiver
      state = (message_receiver.unread?) ? I18n.t('views_communicate_message.unread') : I18n.t('views_communicate_message.read')
      result += (message_receiver.receiver.real_name + ":" + state + "; ")
    end
    result
  end
end
