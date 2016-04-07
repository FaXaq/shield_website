class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.new
    render 'new'
  end

  def show
    current_user

    if User.exists?(params[:id])
      @user = User.find(params[:id])
    elsif User.exists?(name: params[:id])
      @user = User.find_by(name: params[:id])
    else
      redirect_to root_url
    end
    if logged_in? && @user.id === @current_user.id
      @user_posts = @user.posts.last(5)
    elsif
      @user_posts = @user.posts.where(published: true).last(5)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You better rock out !"
      log_in @user
      remember @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    if logged_in? && @current_user.id === params[:id].to_f
      @user = User.find(params[:id])
    else
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    elsif @user.update(user_params_without_password)
        redirect_to @user
    else
        render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if logged_in? && @current_user.id === params[:id].to_f
      @user.destroy
    end
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :firstname, :lastname,
                                 :password, :password_confirmation,
                                 :avatar, :avatar_file_name, :admin)
  end

  private
  def user_params_without_password
    params.require(:user).permit(:name, :email, :firstname, :lastname, :avatar,
                                 :avatar_file_name, :admin)
  end
end
