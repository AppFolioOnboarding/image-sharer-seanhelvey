class ImagesController < ApplicationController
  def index
    current_tag = params[:tag]
    @images = if current_tag
                Image.all.recent.tagged_with(current_tag)
              else
                Image.all.recent
              end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.valid?
      @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
