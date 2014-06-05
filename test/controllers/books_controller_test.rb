require "test_helper"

class BooksControllerTest < ActionController::TestCase

  def setup
    @book = books(:one)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Book.count') do
      post :create, book: { title: 'a new blog', summary: 'a new body' }
    end
  end

  def test_show
    get :show, id: @book
    assert_response :success
  end

  def test_edit
    get :edit, id: @book
    assert_response :success
  end

  def test_update
    put :update, id: @book, book: { title: 'change title' }
    assert_redirected_to book_path(assigns(:book))
  end
end
