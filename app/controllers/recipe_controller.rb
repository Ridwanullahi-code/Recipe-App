class RecipeController < ApplicationController
  def index; end

	def show 
		@recipe = Recipe.includes(:user).find(params[:recipe_id])
	end
end
