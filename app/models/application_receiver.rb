class ApplicationReceiver < ActiveRecord::Base
  belongs_to :receive_application, :class_name => "Application", :foreign_key => "application_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"

  include ActiveModel::Transitions
  state_machine do
    state :pending
    state :approved
    state :rejected

    event :approve do
      transitions :to=>:approved, :from=>:pending, :on_transition => :generate_approve_prompt_info
    end

    event :reject do
      transitions :to=>:rejected, :from=>:pending, :on_transition => :generate_reject_prompt_info
    end
  end

  def state= value
    approve! if pending? && value == "approved"
    reject! if pending? && value == "rejected"
  end

  private

    def generate_approve_prompt_info
      generate_prompt_info(I18n.t('txt.approved'))
    end

     def generate_reject_prompt_info
       generate_prompt_info(I18n.t('txt.rejected'))
     end

    def generate_prompt_info(decision)
      info = ""
      info << receiver.real_name
      info << decision
      info << I18n.t('txt.generate_prompt_info')
      info << receive_application.title + " "
      info << I18n.t("activerecord.models.#{receive_application.class.to_s.underscore}")

      p = PromptMessage.create(:content => info)
      p.receivers << receive_application.sender
    end
end