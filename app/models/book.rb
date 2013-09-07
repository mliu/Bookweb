class Book < ActiveRecord::Base
  # Validations
  validates :department, presence: true
  validates :course_num, presence: true, numericality: {only_integer: true}
  validates :title, presence: true
  validates :isbn, presence: true, length: {minimum: 10}
  validates :author, presence: true
  validates :condition, presence: true
  validates :asking_price, presence: true, numericality: true
  # Relationships
  belongs_to :school, class_name: "School"
  belongs_to :user, class_name: "User"

  def self.search(department, course_num)
    Book.where("department = ? AND course_num = ?", department, course_num.to_s)
  end
end