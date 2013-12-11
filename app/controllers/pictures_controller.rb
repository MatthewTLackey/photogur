class PicturesController < ApplicationController
  
  def index
    @comments = Comment.all
    #@pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    #@pictures_in_order = Picture.order('pictures.created_at DESC').page(params[:page])
    @pictures = Picture.order('pictures.created_at DESC').page(params[:page])
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
    @upload = Picture.new
  end

  def show


    @picture = Picture.find(params[:id])
    @comment = @picture.comments.build

  end

  def new
    @comments = Comment.all
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      #if the save for the picture was successful, go to index.html.erb
      redirect_to pictures_path
    
    else
      #otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end


  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url, :comments)
  end



end