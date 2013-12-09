class CommentsController < ApplicationController

  before_filter :load_picture

  def show

    @comment = Comment.find(params[:id])

  end

  def create
    @comment = @picture.comments.build(comment_params)
    

    if @comment.save
      redirect_to pictures_path#, notice: "Comment created"
    else
      render :action => :index
    end

  end

  def new
    @comment = Comment.new
  end

  

  def edit

  end

  def update

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :picture_id)

  end

  def load_picture
    @picture = Picture.find(params[:picture_id])
  end

end