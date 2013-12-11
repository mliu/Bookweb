class BooksController < ApplicationController
  def about
  end

  def search
  end

  def index
    @book = Book.new
    @univ = params[:school_id]
    @search = params[:search]    
    results = Book.search(@search, @univ)
    @books = results.sort{|y,x| y.asking_price <=> x.asking_price}
    #@books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "You have listed your textbook!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    isbn = params[:book][:isbn].gsub("-","")
    @book = Book.new
    @google_book = GoogleBooks.search('isbn:' + isbn)
    @first_book = @google_book.first
    if @first_book.nil?
      flash[:error] = "No such book exists with ISBN " + isbn
      redirect_to root_path
    end
  end

  def sell1
    @book = Book.new
    #render 'show'
  end

  def email_user
    UserMailer.email_user(params[:from], params[:to], params[:subject], params[:message]).deliver
    redirect_to :back
  end

  private
    def book_params
      params.require(:book).permit(:school_id, :course, :title, :isbn, :condition, :asking_price, :email, :img_url)
    end
end
