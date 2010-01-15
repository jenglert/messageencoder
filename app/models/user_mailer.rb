class UserMailer < ActionMailer::Base

  def message_alert(message)
    recipients message.recipient_email_address
    from       'messages@twistedtxt.com'
    subject    "Special Message From #{message.email_from_name}"
    sent_on    Time.now
    body       :message => message 
  end

end
