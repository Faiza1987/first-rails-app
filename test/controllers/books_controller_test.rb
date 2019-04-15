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

  describe "create" do
    it "can create a book" do
      book_hash = {
        book: {
          title: "Practical Object Oriented Programming in Ruby",
          author: "Sandi Metz",
          description: 'A look at how to design object-oriented systems'
        }
      }
      expect {
        post books_path, params: book_hash
      }.must_change 'Book.count', 1
      must_respond_with  :redirect

      book = Book.find_by(title: "Practical Object Oriented Programming in Ruby")
      
      expect(book).wont_be_nil
      expect(book.title).must_equal book_hash[:book][:title]
      expect(book.author).must_equal book_hash[:book][:author]
      expect(book.description).must_equal book_hash[:book][:description]
    end
  end

  describe "destroy" do
    it "returns a 404 if the book is not found" do 
      # Arrange
      invalid_book_id = 999

      # Act
      # Assert
      expect {
        # Act
        delete book_path(invalid_book_id = 999)
        # Assert
      }.must_change "Book.count", 0
      
      must_respond_with :not_found
    end

    it "can delete a book" do
      # Arrange 
      new_book = Book.create(title: "The Martian")

      expect{
        # Act
        delete book_path(new_book.id)
        # Assert
      }.must_change "Book.count", -1

      # Assert
      must_redirect_to books_path
    end
  end
end
