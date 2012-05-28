class MessageReceiver < ActiveRecord::Base
  belongs_to :receive_message, :class_name => "Message", :foreign_key => "message_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"
end