class Message < ActiveRecord::Base
  # Validations
  validates :email, presence: true
  validates :subjct, presence: true
  validates :message, presence: true

  def self.email_user(from, to, subject, message)
    UserMailer.email_user(from, to, subject, message).deliver
  end
end