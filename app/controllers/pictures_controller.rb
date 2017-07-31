class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @a_month_old = Picture.last_month
    @most_recent = Picture.newest_first.limit(5)
    @pics_from_2017 = Picture.created_in_year(2017)
    @pics_from_2016 = Picture.created_in_year(2016)
    @pics_from_2015 = Picture.created_in_year(2015)
    @pics_from_2014 = Picture.created_in_year(2014)

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    #
    # @picture.title = params[:picture][:title]
    # @picture.artist = params[:picture][:artist]
    # @picture.url = params[:picture][:url]


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    # @picture.save(picture_params)
    #
    # @picture.title = params[:picture][:title]
    # @picture.artist = params[:picture][:artist]
    # @picture.url = params[:picture][:url]


    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :artist, :url)
  end

end
