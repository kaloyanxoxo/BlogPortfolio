class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :edit, :destroy]
  before_action :require_admin, only: [:destroy]


  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end


  def new
    @user = User.new
  end


  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to AlphaBlog, #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.username}'s account was succesfully updated!"
      redirect_to posts_path
    else
      render 'edit'
    end
  end


  def destroy
    @user.destroy
    flash[:danger] = "User and all articles created by user are deleted now"
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = "You don't have permission!"
        redirect_to root_path
      end
    end

    def require_admin
      if logged_in? && !current_user.admin?
        flash[:danger] = "Only admin user has this permission"
        redirect_to root_path
      end
    end
end
