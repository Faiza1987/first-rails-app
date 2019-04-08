require "test_helper"

describe BooksController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "should get index" do
    get "/books"
    must_respond_with :success

  end
end
