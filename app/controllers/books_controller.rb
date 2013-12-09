class BooksController < ApplicationController
  def about
  end

  def search
  end

  def index
    @book = Book.new
    @univ = params[:univ]
    @price_min = params[:min]
    @price_max = params[:max]
    @condition = params[:condition]
    if params[:search]
      @search = params[:search]      
    end
    @books = Book.search(@search, @univ, @price_min, @price_max, @condition).sort{|y,x| y.asking_price <=> x.asking_price}
    #@books = Book.all
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
    require 'googlebooks'
    @book = Book.new
    isbn = params[:book][:isbn]
    @google_book = GoogleBooks.search(isbn)
    @first_book = books.first
  end

  def sell1
    @book = Book.new
    #render 'show'
  end
  def email_user
    UserMailer.email_user(params[:from], params[:to], params[:subject], params[:message]).deliver
  end
  private
    def book_params
      params.require(:book).permit(:school, :course, :title, :isbn, :condition, :asking_price, :email)
    end
end
