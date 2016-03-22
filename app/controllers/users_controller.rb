class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.new
    render 'new'
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
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
                                 :avatar, :avatar_file_name)
  end

  private
  def user_params_without_password
    params.require(:user).permit(:name, :email, :firstname, :lastname, :avatar,
                                 :avatar_file_name)
  end
end
