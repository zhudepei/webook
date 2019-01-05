class BooksController < ApplicationController
  def index
    @books = Book.latest_books
  end

  def show
    @book = Book.find params[:id]
  end
end
