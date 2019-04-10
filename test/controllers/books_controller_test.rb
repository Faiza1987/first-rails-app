require "test_helper"

describe BooksController do
  it "should get index" do
    # get "/books"
    get books_path
    must_respond_with :success
  end

  describe "show" do
    it "should be OK to show an existing valid book" do 
      # Arrange
      book = Book.create(title: "Test book")
      valid_book_id = book.id

      # Act
      # get "/books/#{valid_book_id}"
      get book_path(valid_book_id)

      # Assert
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_book_id = 999
      # Act
      # get "/books/#{invalid_book_id}"
      get book_path(invalid_book_id)

      # Assert
      must_respond_with :not_found
    end

  end
end
