class UserMailer < ActionMailer::Base 	
  def email_user(fromUser, toUser, subject, message)
    mail(from: fromUser,
    	 to: toUser, 
    	 subject: subject,
    	 body: message
    	 )
  end

  def email_me(fromUser, subject, message)
    mail(from: fromUser,
    	 to: "bookmrkt@gmail.com", 
    	 subject: subject,
    	 body: message
    	 )
  end
end
