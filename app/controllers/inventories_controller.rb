class InventoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @inventories = current_user.inventories
  end

  def new
    @inventory = Inventory.new
  end

  private

  def set_recipe
    @inventory = Inventory.find(params[:id])
  end
end
