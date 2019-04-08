class BooksController < ApplicationController
  BOOKS = [
  { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  { title: "Kindred", author: "Octavia E. Butler"}
]

  def index
    @books = BOOKS
  end

  def show
    book_id = params[:id].to_i
    @book = BOOKS[book_id]

    # If the book is non-existant, give back a not_found/404 status code
    if @book.nil?
      head :not_found
    end
  end
end
