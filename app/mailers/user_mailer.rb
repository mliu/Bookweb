class UserMailer < ActionMailer::Base
  default from: "noreply@bookmrkt.com"

  def buy_email(user)
    @user = user

end
