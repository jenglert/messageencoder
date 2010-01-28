class AlterMessageAddReceiptNotificationSent < ActiveRecord::Migration
  def self.up
    add_column :messages, :receipt_notification_sent, :boolean
  end

  def self.down
    drop_column :messages, :receipt_notification_sent
  end
end
