class AlterMessageAddReceiptNotification < ActiveRecord::Migration
  def self.up
    add_column :messages, :receipt_notification, :boolean
    add_column :messages, :receipt_notification_email, :string
  end

  def self.down
    drop_column :messages, :receipt_notification
    drop_column :messages, :receipt_notification_email
  end
end
