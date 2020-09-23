class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def top
  end

  def about
  end

  def index
  	@newbook = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
  	@newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
  	if @newbook.save
  	  redirect_to book_path(@newbook.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
      @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
