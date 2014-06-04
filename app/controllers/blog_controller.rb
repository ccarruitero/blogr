class BlogController < ApplicationController
  before_action :set_blog

  def show
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
