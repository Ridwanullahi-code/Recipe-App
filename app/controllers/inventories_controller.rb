class InventoriesController < ApplicationController
  load_and_authorize_resource param_method: :post_data
  before_action :set_inventory, only: %i[show edit update destroy]

  def index
    @inventories = current_user.inventories
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(post_data)
    @inventory.user_id = current_user.id

    if @inventory.save
      flash[:notice] = 'inventory created successfully'
      redirect_to inventories_path
    else
      render :new
      flash[:notice] = 'Error adding inventory'
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def post_data
    params.require(:inventory).permit(:name)
  end
end
