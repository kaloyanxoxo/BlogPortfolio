class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all.order("created_at desc")
  end


  def show
    @category_posts = @category.posts.paginate(page: params[:page], per_page: 5) 
  end


  def new
    @category = Category.new
  end


  def edit
  end

  def create
    @category = Category.new(category_params)
      if @category.save(category_params)
        flash[:success] = "Category was successfully created."
        redirect_to @category
      else
        render 'new'
      end
  end


  def update
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated."
      redirect_to @category
    end
  end

  def destroy
    @category.destroy
     if @category.destroy
      flash[:danger] = "Category was succesfully deleted."
      redirect_to categories_path
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
