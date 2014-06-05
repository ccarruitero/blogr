class BooksController < ApplicationController
  before_action :set_book, except: [:new, :create]

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render action: 'edit'
    end
  end

  private

  def set_book
    if params[:book_id]
      @book = Book.find(params[:book_id])
    else
      @book = Book.find(params[:id])
    end
  end

  def book_params
    params.require(:book).permit(:title, :summary)
  end
end
