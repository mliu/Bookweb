class Book < ActiveRecord::Base
  # Validations
  validates :department, presence: true
  validates :title, presence: true
  validates :isbn, presence: true, length: {minimum: 10}
  validates :author, presence: true
  validates :condition, presence: true
  validates :asking_price, presence: true, numericality: true
  # Relationships
  belongs_to :school, class_name: "School"
  

  def self.search(search, univ, price_min, price_max, condition)
    if search == ''
      find(:all)
    else
      search = "%" + search + "%"
      where("title LIKE ? OR isbn LIKE ? OR course LIKE ? AND (school_id = ? AND (asking_price >= ? AND asking_price <= ?) AND condition = ?)", search, search, search, univ, price_min, price_max, condition)
    end
  end
end