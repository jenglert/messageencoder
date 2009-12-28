class AddHintsToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :hint1, :string, :length => 255
    add_column :messages, :hint2, :string, :length => 255
    add_column :messages, :hint3, :string, :length => 255
  end

  def self.down
    remove_column :messages, :hint1
    remove_column :messages, :hint2
    remove_column :messages, :hint3
  end
end
