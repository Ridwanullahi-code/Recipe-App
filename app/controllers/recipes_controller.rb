class RecipesController < ApplicationController
  before_action :set_recipe

  def index
    @recipes = current_user.recipe
  end
  def new
     @recipe = Recipe.new
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end