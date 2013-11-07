class CommentController < ApplicationController

  def index
    @comments = [
      :content => "This is a comment",
      :username => "Bill"
      :id => 1
    ]
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
