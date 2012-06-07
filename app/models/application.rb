class Application < ActiveRecord::Base
  belongs_to :sender, :class_name=>"User", :foreign_key=>"sender"

  has_many :application_receivers do
    def reject
      where('state == ?', 'rejected')
    end
    def pending
      where('state == ?', 'pending')
    end
  end
  has_many :receivers,  :through => :application_receivers 
end
