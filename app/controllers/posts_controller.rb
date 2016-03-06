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
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    current_user
    @post = Post.find(params[:id])


    if logged_in? && @current_user.id === @post.user.id

    else
      redirect_to @post
    end
  end

  def create
    current_user
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    @post.save
    redirect_to @post
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
    params.require(:post).permit(:title, :text)
  end
end
