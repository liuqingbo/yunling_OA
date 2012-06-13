class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    add_index :notices, :user_id
  end

  def self.down
    drop_table :notices
  end
end
