class BooksController < ApplicationController
#   BOOKS = [
#   { title: "Hidden Figures", author: "Margot Lee Shetterly"},
#   { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
#   { title: "Kindred", author: "Octavia E. Butler"}
# ]

  def index
    @books = Book.all
  end

  def show
    book_id = params[:id].to_i
    @book = Book.find_by(id: book_id)

    # If the book is non-existant, give back a not_found/404 status code
    if @book.nil?
      head :not_found
    end
  end

  def new 
    @book = Book.new
    @book.title = "Book title"
  end

  def create 
    book = Book.new(book_params)

    is_successful = book.save

    if is_successful
      redirect_to book_path(book.id)
    else
      head :not_found
    end 
  end

  def edit 
    @book = Book.find_by(id: params[:id])
  end

  def update
    book = Book.find_by(id: params[:id])

    is_successful = book.update(book_params)

    if is_successful
      redirect_to book_path
    else
      head :not_found
    end
  end

  def destroy
    book = Book.find( params[:id] )
    if book.nil?
      head :not_found
    else
      book.destroy
      redirect_to books_path
    end
  end

  private

  def book_params
    # responsible for returning strong params as Rails wants it
    # Tells Rails we want params look like the below hash
    # {
    #   book: {
    #     title: "title",
    #     author: "author",
    #     description: "description"
    #   }
    # }
    return params.require(:book).permit(:title, :author, :description)
  end 
end
