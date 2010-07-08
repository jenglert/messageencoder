class MessagesController < ApplicationController
  
  after_filter :send_message_alert_email, :only => :show_dispersal_information
  after_filter :send_guess_correct_email, :only => :guess
  
  def send_guess_correct_email
    if !@message.receipt_notification_sent and @message.receipt_notification_email and !@message.receipt_notification_email.empty? and is_guess_correct?(params, @message)
      UserMailer.deliver_correct_guess_alert @message
      @message.update_attribute :receipt_notification_sent, true
    end
    
  rescue Exception => e
    logger.error "Unable to send guess correct email: #{e.message}"
  end
  
  def send_message_alert_email
    if @message.recipient_email_address and !@message.recipient_email_address.empty?
      UserMailer.deliver_message_alert @message
    end
    
  rescue Exception => e
    logger.error "Unable to send alert email: #{e.message}"
  end
  
  def new
    @message = Message.new( :recipient_email_address_checkbox => "0", :difficulty => "1", :easy => false )
    
    @popup_ad = PopupAd.find(:all, :limit => 1, :order => "Rand()").first()
    
    if params[:message]
      @message.message = params[:message]
      flash[:messages] = "Just fill out these couple of options to send your message"
    end
  end
  
  def easy
    @message = Message.new( :recipient_email_address_checkbox => "0", :difficulty => "1", :easy => true )
    
    @popup_ad = PopupAd.find(:all, :limit => 1, :order => "Rand()").first()
    
    if params[:message]
      @message.message = params[:message]
      flash[:messages] = "Just fill out these couple of options to send your message"
    end
    
    render 'new'
  end
  
  def create
    @message = Message.new(params[:message])
    
    if !@message.save
      render :new
      return
    end
    
    redirect_to :action => 'show_dispersal_information', :id => @message
  end
  
  def show_dispersal_information
    @message = Message.find_by_id(params[:id])
  end
  
  def index
    redirect_to '/'
  end
  
  def show
    @message = Message.find_by_id(params[:id])
    
    if @message.difficulty == 1
      @answers = [@message.answer, @message.answer2, @message.answer3, @message.answer4, @message.answer5, @message.answer6 ].compact.delete_if { 
            |i| i == ''
        }.shuffle
    end
  end
  
  def guess
    @message = Message.find_by_id(params[:id])
    
    if !is_guess_correct?(params, @message)
      flash[:errors] = 'Incorrect guess'
      session[:incorrect_guess_made] = true
      redirect_to @message
    end
    
    
  end
  
  def is_guess_correct?(params, message)
    params[:guess].upcase == message.answer.upcase
  end
end
