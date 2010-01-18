class AddAttemptsToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :attempts, :integer
  end

  def self.down
    remove_column :messages, :attempts
  end
end
