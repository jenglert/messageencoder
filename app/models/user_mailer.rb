class UserMailer < ActionMailer::Base

  def message_alert(message)
    recipients message.recipient_email_address
    from       'messages@twistedtxt.com'
    subject    "Special Message"
    sent_on    Time.now
    body       :message => message 
  end

end
