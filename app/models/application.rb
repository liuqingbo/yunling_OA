class Application < ActiveRecord::Base
  attr_accessible :content, :sender, :state, :sum, :type
end
