class Application < ActiveRecord::Base
  belongs_to :sender, :class_name=>"User", :foreign_key=>"sender"

  has_many :application_receivers , :order=>:created_at do
    def reject
      where('state == ?', 'rejected')
    end
    def pending
      where('state == ?', 'pending')
    end
  end
  has_many :receivers,  :through => :application_receivers

  after_save :create_application_receiver

  def get_receivers_opinion
    user = sender
    while(user.parent)
      raise "ApplicationReceiver cannot found , it shouldn't be happened" if not a_receiver = ApplicationReceiver.find_by_receiver_and_application(user.parent, self)
      return I18n.t("activerecord.state.application.pending") if a_receiver.pending?
      return I18n.t("activerecord.state.application.rejected") if a_receiver.rejected?
      break if sender.level_differ(user.parent) >= 2
      user = user.parent
    end
    return I18n.t("activerecord.state.application.approved")
  end

#  def get_receiver_detail_opinion
#    user = sender
#    str = ""
#    while(user.parent)
#      raise "ApplicationReceiver cannot found , it shouldn't be happened" if not a_receiver = ApplicationReceiver.find_by_receiver_and_application(user.parent, self)
#      str << user.parent.real_name + " : "
#      return str << I18n.t("activerecord.state.application.pending") if a_receiver.pending?
#      if a_receiver.rejected?
#        str << I18n.t("activerecord.state.application.rejected"
#        str << "   " + I18n.t("activerecord.attributes.application_receiver.reason") + " : "
#
#      end
#      break if sender.level_differ(user.parent) >= 2
#      user = user.parent
#    end
#    return I18n.t("activerecord.state.application.approved")
#  end

  private
    def create_application_receiver
      return if not self.sender.parent
      application_receiver = ApplicationReceiver.new
      application_receiver.receiver = self.sender.parent
      application_receiver.receive_application = self
      if not application_receiver.save
        errors.add(:receivers, I18n.t("activerecord.errors.application.create_receiver_error"))
      end
    end
end

