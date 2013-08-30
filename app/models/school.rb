class School < ActiveRecord::Base
  has_many :users, class_name: "User", foreign_key: "school_id"
  has_many :books, class_name: "Book", foreign_key: "school_id"
end
