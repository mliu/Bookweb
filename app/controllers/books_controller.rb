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
       @books = results.sort{|x,y| y.asking_price <=> x.asking_price}
    elsif params[:sort] == "asc"
       @books = results.sort{|y,x| y.condition <=> x.condition}
    elsif params[:sort] == "desc"
       @books = results.sort{|x,y| y.condition <=> x.condition}
    else
       @books = results.sort{|y,x| y.asking_price <=> x.asking_price}
    end
   
    #@books = Book.all
  end

  def create
    @book = Book.new(book_params)
    # @book[:asking_price].gsub("$","")
    if @book.save
      flash[:success] = "You have listed your textbook!"
      redirect_to root_path
    else
      flash[:error] = "Error: Book failed to save"
      redirect_to new_path
    end
  end

  def new
    @book = Book.new(isbn: params[:book][:isbn])
    @isbn = params[:book][:isbn].gsub("-","")
    @google_book = GoogleBooks.search('isbn:' + @isbn)
    @first_book = @google_book.first
    if @first_book.nil? or @first_book.image_link(:zoom => 4).nil?
      flash[:error] = "No such book exists with ISBN " + @isbn
      redirect_to sell1_path
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
