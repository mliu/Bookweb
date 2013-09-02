class BooksController < ApplicationController
  def search
  end

  def index
    @department = params[:department]
    @course_num = params[:course_num]
    @books = Book.search(params[:department], params[:course_num])
  end
end
