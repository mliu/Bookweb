class Book < ActiveRecord::Base
  belongs_to :school, class_name: "School"
  belongs_to :user, class_name: "User"

  def self.search(search)
    Book.where("department = ? AND course_num = ?", params[:department], params[:course_num])
  end
end