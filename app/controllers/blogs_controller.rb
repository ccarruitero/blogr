class BlogsController < ApplicationController
  before_action :set_blog, except: [:new, :create]

  def show
  end

  def new
    @blog = Blog.new
  end

  def get_comments
    comments = @blog.comments

    respond_to do |f|
      f.json { render json: comments}
    end
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render action: 'edit'
    end
  end

  private

  def set_blog
    if params[:blog_id]
      @blog = Blog.find(params[:blog_id])
    else
      @blog = Blog.find(params[:id])
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
