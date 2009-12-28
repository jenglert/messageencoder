class AddDifficultyToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :difficulty, :integer
  end

  def self.down
    drop_column :messages, :difficulty
  end
end
