class User < ActiveRecord::Base
  has_many :books, class_name: "Book", foreign_key: "user_id"
  belongs_to :school, class_name: "School"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
