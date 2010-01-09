class AddShortUrlToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :short_url, :string, :length => 1000
  end

  def self.down
    drop_column :messages, :short_url
  end
end
