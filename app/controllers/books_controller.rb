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
    if params[:sort] == "high"
       @books = results.paginate(:page => params[:page], :per_page => 16, :order => "asking_price DESC")
    elsif params[:sort] == "asc"
       @books = results.paginate(:page => params[:page], :per_page => 16, :order => "asking_price ASC")
    elsif params[:sort] == "desc"
       @books = results.paginate(:page => params[:page], :per_page => 16, :order => "condition DESC")
    else
       @books = results.paginate(:page => params[:page], :per_page => 16, :order => "condition ASC")
    end
  
    #@books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "You have listed your textbook!"
      redirect_to root_path
    else
      redirect_to sell1_path
      flash[:error] = "Oops, there were some errors with your book: " + @book.errors.full_messages.to_sentence
    end
  end

  def new
    @book = Book.new
    @isbn = params[:book][:isbn].gsub("-","")
    @google_book = GoogleBooks.search('isbn:' + @isbn)
    @first_book = @google_book.first
    if @first_book.nil? or @first_book.image_link(:zoom => 4).nil?
      flash[:error] = "Whoops. We can not find a book matching the ISBN " + @isbn
      redirect_to sell1_path
    end
  end

  def sell1
    @book = Book.new
    #render 'show'
  end

  def email_user
    email = Book.find(params[:book][:book_id]).email
    UserMailer.email_user(params[:from], email, params[:subject], params[:message]).deliver
    redirect_to :back
  end

  def contact
    @book = Book.new
  end

  def email_me
    UserMailer.email_me(params[:from], params[:subject], params[:message]).deliver
    flash[:success] = "Email sent! Thank you for contacting us."
    redirect_to :back
  end

  private
    def book_params
      params.require(:book).permit(:school_id, :isbn, :course, :title, :condition, :asking_price, :email, :img_url)
    end
end
