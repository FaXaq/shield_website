# coding: utf-8
class PostsController < ApplicationController
  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.search(params[:search])
    if params[:search] != nil
      @search_param = params[:search]
    end
  end

  def show
    current_user
    post = Post.find(params[:id])
    if post.published === true
      @post = post
    elsif @current_user.id === post.user.id
      @post = post
    end
  end

  def edit
    current_user
    @post = Post.find(params[:id])
    if !logged_in? || (!is_admin? && @current_user.id != @post.user.id)
      redirect_to @post
    end
  end

  def create
    current_user

    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    current_user

    @post = Post.find(params[:id])
    if logged_in? && @current_user.id === @post.user.id
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :avatar, :published, :category_id)
  end
end
