class CommentsController < ApplicationController
  before_action :set_parent
  before_action :set_comment, except: [:new, :create, :index]

  def index
    if @parent.nil?
      @comments = Comment.includes(:commentable).all
    else
      @comments = @parent.comments.includes(:commentable).all
    end
  end

  def new
    @comment = @parent.comments.new
  end

  def create
    @comment = @parent.comments.new(comment_params)

    if @comment.save
      if @parent.class.name == "Blog"
        redirect_to blog_comments_path
      else
        redirect_to book_comments_path
      end
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      if @parent.class.name == "Blog"
        redirect_to blog_comments_path
      else
        redirect_to book_comments_path
      end
    else
      render action: 'edit'
    end
  end

  private

  def set_comment
    @comment = @parent.comments.find(params[:id])
  end

  def set_parent
    if params[:blog_id]
      @parent = Blog.find(params[:blog_id])
    elsif params[:book_id]
      @parent = Book.find(params[:book_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
