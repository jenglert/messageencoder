class MessagesController < ApplicationController
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    
    if !@message.save
      render :new
      return
    end
    
    redirect_to @message
  end
  
  def show
    @message = Message.find_by_id(params[:id])
  end
  
  def guess
    @message = Message.find_by_id(params[:message_id])
    
    if params[:guess] != @message.answer
      flash[:errors] = 'Incorrect guess'
      redirect_to @message
    end
    
    
  end
end
