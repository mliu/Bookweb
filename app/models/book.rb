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
  

  def self.search(search)
    if search
      course = [self[:department], self[:course_num]].join(" ")
      find(:all, :conditions => ['title LIKE #{search} or author LIKE #{search} or isbn LIKE #{search} or #{course} LIKE #{search}'])
    end
  end
end