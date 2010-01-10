class Fixnum
  
  NUMERICAL_ADJECTIVES = [ "First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", 
                          "Eighth", "Ninth", "Tenth", "Eleventh", "Twelveth"]
  
  def human_readable_numbering 
    return self.to_s if self < 1 || self > NUMERICAL_ADJECTIVES.length
    
    NUMERICAL_ADJECTIVES[self - 1]
  end
  
  def to_letter
    (self + 64).chr
  end
end

class String 
  
  def htmlize
    self.gsub "\n", "<br />"
  end
end