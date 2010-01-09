require 'url_shortener'

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Helper that shows a message hint
  def show_message_hint(message, number) 
    return true if message.hint3 and !message.hint3.empty? and number <= 3
    return true if message.hint2 and !message.hint2.empty? and number <= 2
    return true if number == 1
  end
  
  # Helper that determines whether to show a particular answer
  def show_message_answer(message, number) 
    return false if number < 2 || number > 7

    return true if message.answer7 and !message.answer7.empty? and number <= 7
    return true if message.answer6 and !message.answer6.empty? and number <= 6
    return true if message.answer5 and !message.answer5.empty? and number <= 5
    return true if message.answer4 and !message.answer4.empty? and number <= 4
    return true if number == 3
    return true if number == 2
  
    false
  end
  
  def short_url_for(message)
    short_url = message.short_url
    
    return short_url if short_url
    
    bitly = UrlShortener::Authorize.new 'jenglert', 'R_48cb268bf5af653945be32904d39c302'
    client = UrlShortener::Client.new(bitly)
    
    tt_url = full_url_for message
    shorten = client.shorten(tt_url)
    short_url = shorten.urls
    message.update_attribute(:short_url, short_url)
    
    return short_url
  end
  
  # Calculates the full URL for a specified message
  def full_url_for(message) 
    url_for :controller => 'messages', :action => 'show', :id => message.id, :only_path => false
  end
  
  # Creates a custom HTML error messages prompt for the user.
  def custom_error_message_for(object) 
    return "" unless object && object.errors && object.errors.length > 0
    
    error_messages = "<div class='errorMessages'><div class='errorMessagesHeader'>Problems!</div><ul>"
    for error in object.errors.full_messages
      error_messages << "<li>#{error}</li>"
    end
    
    error_messages << "</ul></div>"
  end
  
  # Helper that displays the different message encoding difficulties.
  def message_difficulty_choices(message)
    message_difficulty_choices = '<option value="">Choose</option>'
    
    for key in Message::MESSAGE_DIFFICULTIES.keys
      message_difficulty_choices << "<option value='#{key}' "
      
      if message && message.difficulty && message.difficulty == key
        message_difficulty_choices << "selected='true'"
      end
      
      message_difficulty_choices << ">#{Message::MESSAGE_DIFFICULTIES[key]}</option>"
    end
    
    message_difficulty_choices
  end

  # Shows the parameter iff and only iff the parameter doesn't exist
  def show_iff_param_doesnt_exists(model)
    model_param(model) ? 'displayNone' : ''
  end

  # Returns displayNone iff the model parameters does not exists
  def show_iff_param_exists(model)
    model_param(model) ? '' : 'displayNone'
  end
  
  # Returns displayNone iff the model parameters does not equal the value.
  def show_iff_param_equals(model, value)
    model_param(model) == value ? '' : 'displayNone'
  end
  
  # Returns displayNone unless the paramter indidcated by the model variable equals the value
  def show_iff_param_not_equals(model, value) 
    model_param(model) == value ? 'displayNone' : '' 
  end
  
  def model_param(model)
    
    model_parts = model.split '.'
    
    current_param = params
    
    for model_part in model_parts
      current_param = current_param[model_part.to_sym]
      
      return false if current_param.nil?
    end
    
    current_param
  end
end
