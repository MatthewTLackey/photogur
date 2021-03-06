class PicturesController < ApplicationController
  
  def index   
    @most_recent_pictures = Picture.most_recent_five
    @pictures = Picture.order('pictures.created_at DESC').page(params[:page])
    # respond_to do |format|
    #   format.js
    #   format.html
    # end

    #These steps are taken to allow a picture to be uploaded locally from the index page
    @uploaded_pic = Picture.new
    @upload = ImageUploader.new
    if @upload.store!
      @uploaded_pic = Picture.new(picture_params)
      @uploaded_pic.image = params[:file]
      @uploaded_pic.image = File.open
      @uploaded_pic.save!
      if @uploaded_pic.save
        redirect_to pictures_path
      end
    end
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
    params.require(:picture).permit(:artist, :title, :url, :comments, :image)
  end



end