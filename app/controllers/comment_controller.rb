class CommentController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to comments_path
  end

  private 
  def category_params
    params.require(:content).permit(:picture, :username)
  end
end
