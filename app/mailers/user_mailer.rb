class UserMailer < ActionMailer::Base
 	
  def email_user(fromUser, toUser, subject, message)
    mail(from: fromUser,
    	 to: toUser, 
    	 subject: subject,
    	 body: message
    	 )
  end
end
