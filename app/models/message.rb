class Message < ActiveRecord::Base
  
  CHARACTER_SET = ('a' .. 'z').to_a + ('A' .. 'Z').to_a
  
  def encoded_message
    char_set = Array.new(CHARACTER_SET)
    target_set = Array.new()
    
    while !char_set.empty? do
      index = self.answer.hash.abs % char_set.length
      target_set << char_set[index]
      char_set.delete_at index
    end
    
    encoded_message = ""
    
    puts CHARACTER_SET.join ' '
    puts target_set.join ' '
    
    self.message.each_char do |c|
      for i in 0 .. 51
        if c == CHARACTER_SET[i]
          c = target_set[i]
          break
        end
      end
      encoded_message << c
    end
  
    encoded_message
  end
end
