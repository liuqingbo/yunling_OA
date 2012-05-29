class CreateApplicationReceivers < ActiveRecord::Migration
  def self.up
    create_table :application_receivers do |t|
      t.integer :application_id
      t.integer :user_id
      t.string  :state
      t.text    :reason
      t.timestamps
    end
  end

  def self.down
    drop_table :application_receivers
  end
end
