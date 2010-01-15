class Message < ActiveRecord::Base
  
  CHARACTER_SET = ('a' .. 'z').to_a
  
  MESSAGE_DIFFICULTIES = { 1 => "Easy", 2 => "Medium", 3 => "Hard" }
  
  attr_accessor :recipient_email_address_checkbox
  
  validates_presence_of :message
  validates_presence_of :question
  validates_presence_of :answer 
  
  validate :difficulty_options, :additional_options
  
  # Validations for additional options section.
  def additional_options
    puts self.recipient_email_address_checkbox
    errors.add_to_base("Enter your recipient's email address") if self.recipient_email_address_checkbox == "1" and  (!self.recipient_email_address or self.recipient_email_address.empty?)
    errors.add_to_base("Enter a message for your friend") if self.recipient_email_address_checkbox == "1" and  (!self.email_from_message or self.email_from_message.empty?)
    errors.add_to_base("Enter your name") if self.recipient_email_address_checkbox == "1" and  (!self.email_from_name or self.email_from_name.empty?)
  end
  
  # Validation for the different difficulty options
  def difficulty_options
    errors.add_to_base("Choose a difficulty") unless MESSAGE_DIFFICULTIES.keys.include? self.difficulty 
    
    # Easy difficulty
    if self.difficulty == 1
      errors.add_to_base("Enter at least three potential answers") unless self.answers_completed >= 3
      
    # Medium difficulty
    elsif self.difficulty == 2
      errors.add_to_base("Enter at least one hint") unless self.hints_completed >= 1
      
    # Hard difficulty
    elsif self.difficulty == 3
      # No extra validations are necessary for hard difficulty
    end
  end

  # Retrieves the number of hints entered
  def hints_completed
    hints_completed = 0
    hints_completed = hints_completed + 1 if self.hint1 and !self.hint1.empty?
    hints_completed = hints_completed + 1 if self.hint2 and !self.hint2.empty?
    hints_completed = hints_completed + 1 if self.hint3 and !self.hint3.empty?
    
    hints_completed
  end
  
  # Retrieves the number of answers that have been completed.
  def answers_completed
    answers_completed = 0
    answers_completed = answers_completed + 1 if self.answer and !self.answer.empty?
    answers_completed = answers_completed + 1 if self.answer2 and !self.answer2.empty?
    answers_completed = answers_completed + 1 if self.answer3 and !self.answer3.empty?
    answers_completed = answers_completed + 1 if self.answer4 and !self.answer4.empty?
    answers_completed = answers_completed + 1 if self.answer5 and !self.answer5.empty?
    answers_completed = answers_completed + 1 if self.answer6 and !self.answer6.empty?
    answers_completed = answers_completed + 1 if self.answer7 and !self.answer7.empty?
    
    answers_completed
  end
  
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
