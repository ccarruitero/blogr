require "test_helper"

class BlogsControllerTest < ActionController::TestCase

  def setup
    @blog = blogs(:one)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_show
    get :show, id: @blog
    assert_response :success
  end
end
