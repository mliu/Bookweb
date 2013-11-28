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
    if search == ''
      find(:all)
    else
      course = [:department, :course_num].join(" ")
      where("title LIKE #{search} OR author LIKE #{search} OR isbn LIKE #{search} OR #{course} LIKE #{search}")
    end
  end
end