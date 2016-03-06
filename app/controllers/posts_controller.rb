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
    @post = Post.find(params[:id])
  end

  def create
    current_user

    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    @post.save
    redirect_to @post
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
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
