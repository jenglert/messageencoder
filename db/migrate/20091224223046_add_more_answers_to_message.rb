class AddMoreAnswersToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :answer2, :string, :length => 255
    add_column :messages, :answer3, :string, :length => 255
    add_column :messages, :answer4, :string, :length => 255
    add_column :messages, :answer5, :string, :length => 255
    add_column :messages, :answer6, :string, :length => 255
    add_column :messages, :answer7, :string, :length => 255
  end

  def self.down
    drop_column :messages, :answer2
    drop_column :messages, :answer3
    drop_column :messages, :answer4
    drop_column :messages, :answer5
    drop_column :messages, :answer6
    drop_column :messages, :answer7                    
  end
end
