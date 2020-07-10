class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_back(fallback_location: dashboard_path)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
