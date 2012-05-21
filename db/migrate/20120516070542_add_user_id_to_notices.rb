class AddUserIdToNotices < ActiveRecord::Migration
  def self.up
    add_column :notices, :user_id, :integer
  end

  def self.down
    remove_column :notices, :user_id
  end
end
