class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      render :new
      flash[:notice] = 'Error adding recipe'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'Recipe deleted!'
    redirect_to recipes_path
  end

  private
def recipe_params
params.require(:recipe).permit(:name,:preparation,:cooking,:description,:plublic)
end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
