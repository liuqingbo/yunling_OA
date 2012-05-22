class UsersHaveAndBelongToManyPositions < ActiveRecord::Migration
  def self.up
    create_table :positions_users, :id => false do |t|
      t.references :position, :user
    end
  end

  def self.down
    drop_table :positions_users
  end

end
