class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(plublic: true).order(created_at: :desc)
  end
end
