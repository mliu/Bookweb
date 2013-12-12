class Book < ActiveRecord::Base
  # Validations
  validates :email, presence: true
  validates :title, presence: true
  validates :course, presence: true
  validates :school, presence: true
  validates :condition, presence: true
  validates :asking_price, presence: true, numericality: true
  # Relationships
  belongs_to :school, class_name: "School"
  

  def self.search(search, univ)
    if search == '' or search == nil
      find(:all)
    else
      isbn = search
      search = "%" + search + "%"
      where("school_id = ? AND (title LIKE ? OR isbn = ? OR course LIKE ?)", univ, search, isbn, search)
    end
  end
end