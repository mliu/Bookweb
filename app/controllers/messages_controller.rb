class MessagesController < ApplicationController
  
  def create
   Message.email_user(params[:from], params[:to], params[:subject], params[:message]).deliver
  end

end
