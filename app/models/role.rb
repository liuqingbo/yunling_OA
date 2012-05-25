class Role < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users
  has_many :grants
  has_many :rights, :through=>:grants 
  scope :for, lambda{|action, resource|
                  where("rights.operation=? AND rights.resource = ?",
                    Right::OPERATION_MAPPINGS[action], resource
                  )}
end
