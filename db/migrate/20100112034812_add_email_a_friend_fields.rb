class AddEmailAFriendFields < ActiveRecord::Migration
  def self.up
    add_column :messages, :email_from_name, :string
  end

  def self.down
    drop_column :messages, :email_from_name
  end
end
