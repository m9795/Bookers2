class BooksController < ApplicationController
  
  def new
  end

  def create
  end

  def index
    @book = Book.new
  end

  def show
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
