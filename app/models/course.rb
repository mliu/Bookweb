class Course < ActiveRecord::Base
  has_many :books, class_name: "Book", foreign_key: "course_id"
end