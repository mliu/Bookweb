class InfoController < ApplicationController
  def index
  	
  end

  def about
  end 

  def contact
  	@message = Info.new
  end
end
