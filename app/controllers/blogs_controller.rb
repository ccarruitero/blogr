class BlogsController < ApplicationController
  before_action :set_blog

  def show
  end

  def get_comments
    comments = @blog.comments

    respond_to do |f|
      f.json { render json: comments}
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
end
