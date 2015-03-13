class ChefsController < ApplicationController
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 9)
  end
  
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      redirect_to recipes_path, notice: 'Your account has been successfully created.'
    else
      render :new
    end
  end
  
  def edit
    @chef = Chef.find(params[:id])
  end  
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      redirect_to recipes_path, notice: 'Your account has been successfully updated .'
    else
      render :edit
    end
  end
  
  def show
    @chef = Chef.find(params[:id])
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 10)
  end
  
  private
    
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
end
