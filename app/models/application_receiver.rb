class ApplicationReceiver < ActiveRecord::Base
  belongs_to :receive_application, :class_name => "Application", :foreign_key => "application_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"


end