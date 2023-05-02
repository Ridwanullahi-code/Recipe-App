class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = current_user.recipes
  end
  def new
     @recipe = Recipe.new
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end