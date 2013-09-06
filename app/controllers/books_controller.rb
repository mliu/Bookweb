class BooksController < ApplicationController
  def search
  end

  def index
    @department = params[:department]
    @course_num = params[:course_num]
    @books = Book.search(params[:department], params[:course_num]).sort{|y,x| y.askingprice <=> x.askingprice}
  end

  def create
  end

  def new
    @book = Book.new
  end
end
