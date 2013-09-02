class BookController < ApplicationController
  def search
  end

  def index
    @books = Book.search(params[:department, :course_num])
  end
end
