class Book < ActiveRecord::Base
  belongs_to :school, class_name: "School"
end
