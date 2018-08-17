class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order("created_at desc") 
  end

  
  def show
  end

 
  def new
    @post = Post.new
  end

  
  def edit
  end

 
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.update_attributes(:category_id => params[:post][:category_id])
    debugger
      if @post.save
        flash[:success] = "Post was succesfully created"
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  def update
      if @post.update(post_params)
        flash[:success] = "Post was succesfully updated"        
        redirect_to post_path @post
      else
        redirect_to 'edit'
      end
  end

  def destroy
    if @post.destroy
      flash[:danger] = "Post was succesfully deleted"
      redirect_to posts_path
    end      
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :category_id)
    end

    def require_same_user
      if current_user != @post.user and !current_user.admin?
        flash[:danger] = "You can only edit your posts!"
        redirect_to root_path
      end
    end
end
