class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.last(5).reverse
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description, :category_id)
  end
end
