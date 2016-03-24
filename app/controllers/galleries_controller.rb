class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.search(params[:search_gallery])
    if params[:search_gallery] != nil
      @gallery_search_param = params[:search_gallery]
    end
  end

  def new
    @gallery = Gallery.new
    if !logged_in?
      redirect_to root_url
    end
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
    @gallery = Gallery.find(params[:id])
    if !(logged_in? && @gallery.post.user.id.to_i === current_user.id) && !is_admin?
      redirect_to @gallery
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if is_admin?
      if @gallery.update(gallery_params)
        redirect_to @gallery
      else
        render 'edit'
      end
    else
      redirect_to @gallery
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description, :category_id, :post_id, photos_attributes: [:gallery_id, :id, :title, :description, :alt, :image, :_destroy])
  end
end
