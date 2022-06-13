class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
    @user = @show_book.user
  end

  def edit
    @show_book = Book.find(params[:id])
    @user = @show_book.user
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @show_book = Book.find(params[:id])
    if @show_book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@show_book.id)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
