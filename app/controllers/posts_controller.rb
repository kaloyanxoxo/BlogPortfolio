class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at desc") 
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

      if @post.save
        flash[:notice] = "Post was succesfully created"
        redirect_to @post
      else
        render 'new'
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        flash[:notice] = "Post was succesfully updated"        
        redirect_to @post
      else
        redirect_to 'edit'
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    if @post.destroy
      flash[:notice] = "Post was succesfully deleted"
      redirect_to posts_path
    end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
