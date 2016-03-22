class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    if is_admin?
      @category = Category.new
    else
      redirect_to root_url
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You better rock out !"
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    if is_admin?
      @category = Category.find(params[:id])
    else
      redirect_to category_path
    end
  end

  def update

    @category = Category.find(params[:id])
    if is_admin?
      if @category.update(category_params)
        redirect_to @category
      else
        render 'edit'
      end
    else
      redirect_to @category
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to posts_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
