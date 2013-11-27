class BooksController < ApplicationController
  def about
  end

  def search
  end

  def index
    @department = params[:department]
    @course_num = params[:course_num]
    @books = Book.search(params[:search]).sort{|y,x| y.asking_price <=> x.asking_price}
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:book_create] = "You have listed your textbook!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @book = Book.new
  end

  private
    def book_params
      params.fetch(:books, {}).permit(:department, :course_num, :title, :author, :isbn, :condition, :asking_price, :email)
    end
end
