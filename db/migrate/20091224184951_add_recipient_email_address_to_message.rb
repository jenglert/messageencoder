class AddRecipientEmailAddressToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :recipient_email_address, :string, :length => 255
  end

  def self.down
    drop_column :messages, :recipient_email_address
  end
end
