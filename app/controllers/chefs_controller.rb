class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :check_access, only: [:edit, :update]
  
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 9)
  end
  
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef.id
      redirect_to @chef, notice: 'Your account has been successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end  
  
  def update
    if @chef.update(chef_params)
      redirect_to chef_path(@chef), notice: 'Your account has been successfully updated .'
    else
      render :edit
    end
  end
  
  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 10)
  end
  
  private
    
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
    
    def set_chef
      @chef = Chef.find(params[:id])
    end
    
end
