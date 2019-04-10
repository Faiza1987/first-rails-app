class BooksController < ApplicationController
  BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]

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
end
