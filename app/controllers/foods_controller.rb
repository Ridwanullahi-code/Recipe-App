class FoodsController < ApplicationController
    def index
      @foods = current_user.Foods.all
    end
  
    def show
      @food = current_user.Foods.find(params[:id])
    end
  
    def new
      @food = current_user.Foods.new
    end
  
    def create
      @food = current_user.Foods.new(food_params)
      if @food.save
        redirect_to foods_path, notice: 'Food was successfully saved.'
      else
        render :new
      end
    end
  
    def destroy
      @food = current_user.Foods.find(params[:id])
  
      if @food.destroy
        flash[:success] = 'Food was successfully deleted.'
      else
        flash[:error] = 'Failed to delete food.'
      end
      redirect_to foods_path
    end
  
    private
  
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
    end
  end