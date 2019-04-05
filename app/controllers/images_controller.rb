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

  def destroy
    @image = Image.find(params[:id])

    message = if @image.destroy
                'Image destroyed successfully'
              else
                'Image could not be destroyed'
              end

    respond_to do |format|
      format.html { redirect_to images_url, notice: message }
      format.json { head :ok }
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
