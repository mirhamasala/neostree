class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient

    if @ingredient.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient

    @ingredient.destroy
    redirect_to dashboard_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
