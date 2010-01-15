class AddMessageToFromEmail < ActiveRecord::Migration
  def self.up
    add_column :messages, :email_from_message, :text
  end

  def self.down
    drop_column :messages, :email_from_message
  end
end
