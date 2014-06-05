require "test_helper"

class CommentsControllerTest < ActionController::TestCase

  def setup
    @blog = blogs(:one)
    @comment = comments(:one)
    @comment.update(commentable_id: @blog.id, commentable_type: 'Blog')
  end

  def test_new
    get :new, blog_id: @blog.id
    assert_response :success
  end

  def test_create
    assert_difference('Comment.count') do
      post :create, blog_id: @blog.id,
           comment: { body: 'a comment', commentable: 'Blog' }
    end
  end

  def test_edit
    get :edit, id: @comment, blog_id: @blog.id
    assert_response :success
  end

  def test_update
    put :update, id: @comment, blog_id:  @blog.id,
        comment: { body: 'change body' }
    assert_redirected_to blog_comments_path
  end
end
