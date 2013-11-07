class CommentsController < ApplicationController

  def index
    @picture = Picture.find(params[:picture_id])
    @comments = @picture.comments

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end