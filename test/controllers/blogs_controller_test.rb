require "test_helper"

class BlogsControllerTest < ActionController::TestCase

  def setup
    @blog = blogs(:one)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Blog.count') do
      post :create, blog: { title: 'a new blog', body: 'a new body' }
    end
  end

  def test_show
    get :show, id: @blog
    assert_response :success
  end

  def test_edit
    get :edit, id: @blog
    assert_response :success
  end

  def test_update
    put :update, id: @blog, blog: { title: 'change title' }
    assert_redirected_to blog_path(assigns(:blog))
  end

  def test_destroy
    assert_difference('Blog.count', -1) do
      delete :destroy, id: @blog
    end
  end
end
