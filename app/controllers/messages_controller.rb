class MessagesController < ApplicationController
  
  def new
    @message = Message.new( :recipient_email_address_checkbox => "1" )
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
    
    if params[:guess] != @message.answer
      flash[:errors] = 'Incorrect guess'
      redirect_to @message
    end
    
    
  end
end
