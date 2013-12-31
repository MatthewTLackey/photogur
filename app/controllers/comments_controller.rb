class CommentsController < ApplicationController

  before_filter :load_picture

  def create
    @comment = @picture.comments.build(comment_params)
    
    if @comment.save
      redirect_to picture_path(@picture.id), notice: "Comment created"
    else
      render :action => :show, notice: "Failed to create comment"
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :picture_id)

  end

  def load_picture
    @picture = Picture.find(params[:picture_id])
  end

end