class MessageReceiver < ActiveRecord::Base
  belongs_to :receive_message, :class_name => "Message", :foreign_key => "message_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"

  include ActiveModel::Transitions
  state_machine do
    state :unread
    state :read

    event :read_message do
      transitions :to=>:read, :from=>[:unread, :read]
    end
  end

  def MessageReceiver.find_by_message_and_receiver(message, receiver)
    where("message_id = ? and user_id = ?", message.id, receiver.id)
  end
end