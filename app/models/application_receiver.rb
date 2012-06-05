class ApplicationReceiver < ActiveRecord::Base
  belongs_to :receive_application, :class_name => "Application", :foreign_key => "application_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"

  include ActiveModel::Transitions
  state_machine do
    state :pending
    state :approved
    state :rejected

    event :approve do
      transitions :to=>:approved, :from=>:pending, :on_transition => :generate_prompt_info
    end

    event :reject do
      transitions :to=>:rejected, :from=>:pending, :on_transition => :generate_prompt_info
    end
  end

  private
    def generate_prompt_info

      PromptMessage.create(:content)
    end

end