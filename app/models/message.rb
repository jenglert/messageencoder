class Message < ActiveRecord::Base
  
  CHARACTER_SET = ('a' .. 'z').to_a
  
  def encoded_message
    char_set = Array.new(CHARACTER_SET)
    target_set = Array.new()
    
    # Add all the characters from the original set into the target set.
    while !char_set.empty? do
      index = self.answer.hash.abs % char_set.length
      target_set << char_set[index]
      char_set.delete_at index
    end
    
    encoded_message = ""
    
    # For each character in the message
    self.message.each_char do |c|
      
      # Iterate over the 26 letters
      for i in 0 .. 25
        
        # Look for lower cose letters
        if c == CHARACTER_SET[i]
          c = target_set[i]
          break
          
        # Look for upper case letters
        elsif c == (CHARACTER_SET[i][0] - 32).chr
          c = target_set[i].upcase
          break
        end
      end
      
      # Add the messages to the encoded version of the message.
      encoded_message << c
    end
  
    encoded_message
  end
end
