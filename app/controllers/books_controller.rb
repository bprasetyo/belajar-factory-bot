class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @book.initialize_book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      @error_messages = @book.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    @book = Book.find_by_id(params[:id])
    @book.assign_attributes(book_params)

    if @book.save
      redirect_to book_path(@book)
    else
      @error_messages = @book.errors.full_messages
      render 'edit'
    end
  end

  def show
    @book = Book.find_by_id(params[:id])
    if @book.nil?
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit!
  end
  
  
end