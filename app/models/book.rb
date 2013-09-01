class Book < ActiveRecord::Base
  belongs_to :school, class_name: "School"
  belongs_to :user, class_name: "User"
end
