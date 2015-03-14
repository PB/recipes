class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @categry = Category.find(params[:id])
    @recipes = @categry.recipes.paginate(page: params[:page], per_page: 9)
    render 'recipes/index'
  end
  
  private
  
    def category_params
      params.require(:category).permit(:name)
    end
end
