class Book < ActiveRecord::Base
  belongs_to :school, class_name: "School"
  belongs_to :user, class_name: "User"

  def self.search(department, course_num)
    Book.where("department = ? AND course_num = ?", department, course_num.to_s)
  end
end