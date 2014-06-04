class CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:commentable).all
  end
end
